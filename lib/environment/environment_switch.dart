import 'package:classified_app/environment/tester.dart';
// import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:classified_app/environment/environment.dart';
import 'package:classified_app/environment/i_environment_switch.dart';

const ENVIRONMENT = 'ENV';

class EnvironmentManager implements IEnvironmentManager {
  final SharedPreferences _sharedPreferences;

  EnvironmentManager(
    this._sharedPreferences,
  );
  @override
  Environment get environment =>
      _environmentFromInt(_sharedPreferences.getInt(ENVIRONMENT) ?? 1);

  set environment(Environment environment) {
    setEnvironment(environment);
  }

  void setEnvironment(Environment environment) async {
    await _sharedPreferences.setInt(
        ENVIRONMENT, _environmentToInt(environment));
  }

  int _environmentToInt(Environment environment) {
    if (environment == Environment.dev) {
      return 0;
    }
    return 1;
  }

  Environment _environmentFromInt(int intValue) {
    if (intValue == 0) {
      return Environment.dev;
    }
    return Environment.prod;
  }

  @override
  void switchEnvironment() {
    bool tester = Tester.verify();
    if (tester) {
      if (environment == Environment.dev) {
        environment = Environment.prod;
      } else {
        environment = Environment.dev;
      }
      // Restart.restartApp();
    } else {
      environment = Environment.prod;
    }
  }
}
