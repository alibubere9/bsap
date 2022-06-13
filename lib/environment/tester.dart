import 'package:classified_app/data/repositories/interfaces/i_user_repository.dart';
import 'package:classified_app/utils/system_settings.dart';

import '../injection.dart';

class Tester {
  static final IUserRepository _userRepository = sl<IUserRepository>();

  Tester._();

  static bool verify() {
    String testNumbers =
        SystemSettingManager.getSetting(SystemSettingsTypes.testNumbersList);
    List<String> separatedNumbers = testNumbers.split(",");

    if (_userRepository.isLoggedIn) {
      String currentUserPhone = _userRepository.user!.mobileNumber!;
      return separatedNumbers.any((element) =>
          element.contains(currentUserPhone) ||
          element.contains(currentUserPhone.substring(3)));
    }
    return false;
  }
}
