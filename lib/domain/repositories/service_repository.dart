
import '../entities/service.dart';

abstract class ServiceRepository {
  Future<void> addService(Service service);
  Future<List<Service>> getServices();
}
