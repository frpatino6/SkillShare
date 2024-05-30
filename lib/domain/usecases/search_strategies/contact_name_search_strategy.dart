
import 'service_search_strategy.dart';
import '../../entities/service.dart';

class ContactNameSearchStrategy implements ServiceSearchStrategy {
  @override
  bool matches(Service service, String query) {
    return service.contactName.toLowerCase().contains(query.toLowerCase());
  }
}
