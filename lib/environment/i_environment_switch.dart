import 'package:classified_app/environment/environment.dart';

abstract class IEnvironmentManager {
  Environment get environment;
  void switchEnvironment();
}
