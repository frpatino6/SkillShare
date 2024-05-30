// lib/domain/usecases/service_search_manager.dart
import '../../domain/entities/service.dart';
import 'search_strategies/service_search_strategy.dart';

class ServiceSearchManager {
  final List<ServiceSearchStrategy> strategies;

  ServiceSearchManager(this.strategies);

  List<Service> search(List<Service> services, String query) {
    return services.where((service) {
      return strategies.any((strategy) => strategy.matches(service, query));
    }).toList();
  }
}
