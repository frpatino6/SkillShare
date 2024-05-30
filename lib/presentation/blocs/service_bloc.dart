import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/service.dart';
import '../../domain/usecases/add_service.dart';
import '../../domain/usecases/get_services.dart';
import '../../domain/usecases/service_search_manager.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final AddService addService;
  final GetServices getServices;
  final ServiceSearchManager searchManager;
  List<Service> allServices = [];

  ServiceBloc({
    required this.addService,
    required this.getServices,
    required this.searchManager,
  }) : super(ServiceInitial()) {
    on<AddServiceEvent>(_onAddServiceEvent);
    on<GetServicesEvent>(_onGetServicesEvent);
    on<SearchServicesEvent>(_onSearchServicesEvent);
  }

  void _onAddServiceEvent(AddServiceEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoading());
    try {
      await addService(event.service);
      emit(ServiceAdded());
      // Re-fetch services to include the newly added service
      add(GetServicesEvent());
    } catch (e) {
      emit(ServiceError("Failed to add service"));
    }
  }

  void _onGetServicesEvent(GetServicesEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoading());
    try {
      allServices = await getServices();
      emit(ServiceLoaded(allServices));
    } catch (e) {
      emit(ServiceError("Failed to fetch services"));
    }
  }

  void _onSearchServicesEvent(SearchServicesEvent event, Emitter<ServiceState> emit) async {
    final filteredServices = searchManager.search(allServices, event.query);
    emit(ServiceLoaded(filteredServices));
  }
}
