
import 'service_search_strategy.dart';
import '../../entities/service.dart';

class NameSearchStrategy implements ServiceSearchStrategy {
  @override
  bool matches(Service service, String query) {
    return service.name.toLowerCase().contains(query.toLowerCase());
  }
}
