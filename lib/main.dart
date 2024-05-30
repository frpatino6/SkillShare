import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/signup_page.dart';
import 'presentation/pages/service_list_page.dart';
import 'presentation/pages/add_service_page.dart';
import 'presentation/themes/app_theme.dart';
import 'presentation/blocs/service_bloc.dart';
import 'data/repositories/service_repository_impl.dart';
import 'domain/usecases/add_service.dart';
import 'domain/usecases/get_services.dart';
import 'domain/usecases/search_strategies/service_search_strategy.dart';
import 'domain/usecases/search_strategies/name_search_strategy.dart';
import 'domain/usecases/search_strategies/description_search_strategy.dart';
import 'domain/usecases/search_strategies/category_search_strategy.dart';
import 'domain/usecases/search_strategies/contact_name_search_strategy.dart';
import 'domain/usecases/service_search_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final serviceRepository = ServiceRepositoryImpl();
  final addService = AddService(serviceRepository);
  final getServices = GetServices(serviceRepository);

  final searchStrategies = [
    NameSearchStrategy(),
    DescriptionSearchStrategy(),
    CategorySearchStrategy(),
    ContactNameSearchStrategy(),
  ];

  final searchManager = ServiceSearchManager(searchStrategies);

  runApp(MyApp(
    addService: addService,
    getServices: getServices,
    searchManager: searchManager,
  ));
}

class MyApp extends StatelessWidget {
  final AddService addService;
  final GetServices getServices;
  final ServiceSearchManager searchManager;

  const MyApp({super.key, required this.addService, required this.getServices, required this.searchManager});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ServiceBloc(
            addService: addService,
            getServices: getServices,
            searchManager: searchManager,
          )..add(GetServicesEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Service App',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/service_list': (context) => const ServiceListPage(),
          '/add': (context) => AddServicePage(),
        },
      ),
    );
  }
}
