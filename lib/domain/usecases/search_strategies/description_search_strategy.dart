// lib/domain/usecases/search_strategies/description_search_strategy.dart
import 'service_search_strategy.dart';
import '../../entities/service.dart';

class DescriptionSearchStrategy implements ServiceSearchStrategy {
  @override
  bool matches(Service service, String query) {
    return service.description.toLowerCase().contains(query.toLowerCase());
  }
}
