import 'package:classified_app/data/models/app_message.dart';

abstract class IAppMessageRepository {
  Future<void> loadAllAppMessages();
  AppMessage? getAppMessageByKey(String key);
  List<AppMessage> get allAppMessages;
}
