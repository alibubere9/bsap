import 'dart:convert';

import 'package:classified_app/data/models/system_settings.dart';
import 'package:classified_app/data/repositories/interfaces/i_syst_setting_repo.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

const SYSTEM_SETTINGS_LIST = "SYSTEM_SETTINGS_LIST";

class SystemSettingsRepository extends ISystemSettingsRepository {
  final SharedPreferences _sharedPreferences;
  final ExecutionHandler _executionHandler;

  SystemSettingsRepository(this._sharedPreferences, this._executionHandler);

  Future<void> loadAllSystemSettings() async {
    String json = await _executionHandler.getSystemSettings();
    List list = jsonDecode(json);
    List<String> systemSettings = [];
    list.forEach((element) {
      systemSettings.add(SystemSetting.fromMap(element).toJson());
    });
    await _sharedPreferences.setStringList(
        SYSTEM_SETTINGS_LIST, systemSettings);
  }

  List<SystemSetting> get allSystemSettings {
    List<String> all =
        _sharedPreferences.getStringList(SYSTEM_SETTINGS_LIST) ?? [];
    List<SystemSetting> systemSettings = [];
    all.forEach((element) {
      systemSettings.add(SystemSetting.fromJson(element));
    });
    return systemSettings;
  }

  SystemSetting? getAppMessageByKey(String settingType) {
    return allSystemSettings
        .firstWhere((element) => element.settingType == settingType);
  }
}
