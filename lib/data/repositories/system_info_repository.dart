import 'package:classified_app/data/repositories/interfaces/i_system_info_repository.dart';
import 'package:package_info/package_info.dart';

class SystemInfoRepository implements ISystemInfoRepository {
  final PackageInfo _packageInfo;

  SystemInfoRepository(this._packageInfo);
  @override
  String get appVersion => _packageInfo.version;
}
