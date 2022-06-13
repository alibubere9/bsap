import 'package:classified_app/data/models/system_settings.dart';
import 'package:classified_app/data/repositories/interfaces/i_syst_setting_repo.dart';
import '../injection.dart';

class SystemSettingManager {
  /// Thiis is the default system settings map, this will be used for the values which fail to get
  /// retrived from the server
  static const Map<String, dynamic> _defaultSystemSettings = {
    SystemSettingsTypes.minimumSupportedVersion:
        _SystemSettingsDefaults.minimumSupportedVersion,
    SystemSettingsTypes.testNumbersList:
        _SystemSettingsDefaults.testNumbersList,
    SystemSettingsTypes.aboutUs: _SystemSettingsDefaults.aboutUs,
    SystemSettingsTypes.copyright: _SystemSettingsDefaults.copyright,
    SystemSettingsTypes.privacyPolicy: _SystemSettingsDefaults.privacyPolicy,
    SystemSettingsTypes.thirdPartyNotices:
        _SystemSettingsDefaults.thirdPartyNotices,
    SystemSettingsTypes.tnc: _SystemSettingsDefaults.tnc,
    SystemSettingsTypes.playStoreAppUrl:
        _SystemSettingsDefaults.playStoreAppUrl,
    SystemSettingsTypes.appStoreAppUrl: _SystemSettingsDefaults.appStoreAppUrl
  };

  SystemSettingManager._();

  /// This will be the actual map we will use to display the system settings in the UI,
  static Map<String, dynamic> _systemSettings = {};

  /// This function will be directly used in the UI to access the loaded system settings.
  static String getSetting(String key) {
    if (_systemSettings.containsKey(key)) {
      return _systemSettings[key]!;
    }
    return _defaultSystemSettings[key]!;
  }

  /// This function will be called when the app is started, it will get the system Settings
  /// from the [ISystemSettingsRepository] at the time when the app is started.
  static Future<void> loadSystemSetings() async {
    ISystemSettingsRepository _systemSettingsRepository =
        sl<ISystemSettingsRepository>();
    await _systemSettingsRepository.loadAllSystemSettings();
    List<SystemSetting> all = _systemSettingsRepository.allSystemSettings;
    all.forEach((element) {
      _systemSettings[element.settingType] = element.value;
    });
  }
}

/// This class will hold the values for all the keys we need to use across the app.
class SystemSettingsTypes {
  SystemSettingsTypes._();
  static const minimumSupportedVersion = "MinimumSupportedVersion";
  static const testNumbersList = "TestNumbersList";
  static const privacyPolicy = "PrivacyPolicy";
  static const aboutUs = "AboutUs";
  static const tnc = "TermsAndConditions";
  static const thirdPartyNotices = "ThirdPartyNotices";
  static const copyright = "Copyright";
  static const playStoreAppUrl = "PlayStoreAppUrl";
  static const appStoreAppUrl = "AppStoreAppUrl";
}

/// This class will hold all the default messages for the application in case the value fails from the API
class _SystemSettingsDefaults {
  _SystemSettingsDefaults._();
  static const minimumSupportedVersion = "1.0.0";
  static const testNumbersList = "8668821214,9222360780,8149997223";
  static const privacyPolicy = "https:/admin.elaundry.ae/Privacy";
  static const aboutUs = "https:/admin.elaundry.ae/Privacy";
  static const tnc = "https:/admin.elaundry.ae/Privacy";
  static const thirdPartyNotices = "https:/admin.elaundry.ae/Privacy";
  static const copyright = "https:/admin.elaundry.ae/Privacy";
  static const playStoreAppUrl = "https:/admin.elaundry.ae/Privacy";
  static const appStoreAppUrl = "https:/admin.elaundry.ae/Privacy";
}
