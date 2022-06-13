import 'package:classified_app/data/models/system_settings.dart';

abstract class ISystemSettingsRepository {
  Future<void> loadAllSystemSettings();
  List<SystemSetting> get allSystemSettings;
  SystemSetting? getAppMessageByKey(String settingType);
}
