import 'package:classified_app/services/interfaces/i_force_update.dart';
import 'package:classified_app/utils/system_settings.dart';
import 'package:package_info/package_info.dart';

class ForceUpdateService implements IForceUpdateService {
  final PackageInfo _packageInfo;

  ForceUpdateService(this._packageInfo);
  @override
  bool get isSupported {
    String minimumSuppportedVersion = SystemSettingManager.getSetting(
        SystemSettingsTypes.minimumSupportedVersion);
    int mainVersion = int.parse(version.substring(0, 1));
    double subVersion = double.parse(version.substring(2));
    int mainVersionSupported =
        int.parse(minimumSuppportedVersion.substring(0, 1));
    double subVersionSupported =
        double.parse(minimumSuppportedVersion.substring(2));
    if (mainVersion < mainVersionSupported) {
      return false;
    } else {
      if (subVersion < subVersionSupported) {
        return false;
      }
    }
    return true;
  }

  @override
  String get version => _packageInfo.version;
}
