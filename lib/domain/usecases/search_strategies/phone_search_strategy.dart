
import 'service_search_strategy.dart';
import '../../entities/service.dart';

class PhoneSearchStrategy implements ServiceSearchStrategy {
  @override
  bool matches(Service service, String query) {
    return service.phone.toLowerCase().contains(query.toLowerCase());
  }
}
