import 'package:firebase_database/firebase_database.dart';
import '../../domain/entities/service.dart';
import '../../domain/repositories/service_repository.dart';
import '../models/service_model.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final DatabaseReference database = FirebaseDatabase.instance.reference().child('services');

  @override
  Future<void> addService(Service service) async {
    await database.push().set(ServiceModel(
      id: service.id,
      name: service.name,
      description: service.description,
      category: service.category,
      contactName: service.contactName,
      email: service.email,
      phone: service.phone,
      address: service.address,
    ).toJson());
  }

  @override
  Future<List<Service>> getServices() async {
    DatabaseEvent event = await database.once();
    DataSnapshot snapshot = event.snapshot;
    List<Service> services = [];
    if (snapshot.value != null) {
      Map<dynamic, dynamic> map = snapshot.value as Map<dynamic, dynamic>;
      map.forEach((key, value) {
        if (value is Map) {
          // Convertir value a Map<String, dynamic>
          final Map<String, dynamic> serviceData = Map<String, dynamic>.from(value);
          serviceData['id'] = key;
          services.add(ServiceModel.fromJson(serviceData));
        }
      });
    }
    return services;
  }
}
