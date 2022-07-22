import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:classified_app/data/models/app_message.dart';
import 'package:classified_app/data/repositories/interfaces/i_app_message_repo.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';

const APP_MESSAGE_LIST = "APP_MESSAGE_LIST";

class AppMessageRepository extends IAppMessageRepository {
  final SharedPreferences _sharedPreferences;
  final ExecutionHandler _executionHandler;

  AppMessageRepository(
    this._sharedPreferences,
    this._executionHandler,
  );

  Future<void> loadAllAppMessages() async {
    String json = await _executionHandler.getAppMessages();
    List list = jsonDecode(json);
    List<String> appMessages = [];
    list.forEach((element) {
      appMessages.add(AppMessage.fromMap(element).toJson());
    });
    await _sharedPreferences.setStringList(APP_MESSAGE_LIST, appMessages);
  }

  List<AppMessage> get allAppMessages {
    List<String> all = _sharedPreferences.getStringList(APP_MESSAGE_LIST) ?? [];
    List<AppMessage> appMessages = [];
    all.forEach((element) {
      appMessages.add(AppMessage.fromJson(element));
    });
    return appMessages;
  }

  AppMessage? getAppMessageByKey(String key) {
    return allAppMessages.firstWhere((element) => element.key == key);
  }
}
