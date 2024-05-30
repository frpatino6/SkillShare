
import 'service_search_strategy.dart';
import '../../entities/service.dart';

class CategorySearchStrategy implements ServiceSearchStrategy {
  @override
  bool matches(Service service, String query) {
    return service.category.toLowerCase().contains(query.toLowerCase());
  }
}
