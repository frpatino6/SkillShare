
import 'package:skill_share/domain/entities/service.dart';

abstract class ServiceSearchStrategy {
  bool matches(Service service, String query);
}
