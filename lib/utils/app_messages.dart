import 'dart:convert';

import 'package:classified_app/const/strings.dart';
import 'package:classified_app/data/models/app_message.dart';
import 'package:classified_app/data/repositories/interfaces/i_app_message_repo.dart';
import '../injection.dart';

class AppMessagesManager {
  /// Thiis is the default app message map, this will be used for the values which fail to get
  /// retrived from the server
  static const Map<String, String> _defaultMessages = {
    AppMessageKeys.update: _AppMessageDefaults.update,
    AppMessageKeys.email: _AppMessageDefaults.email,
    AppMessageKeys.phoneNumber: _AppMessageDefaults.phoneNumber,
    AppMessageKeys.sendFeeback: _AppMessageDefaults.sendFeeback,
    AppMessageKeys.shareArticle: _AppMessageDefaults.shareArticle,
    AppMessageKeys.shareBanner: _AppMessageDefaults.shareBanner,
    AppMessageKeys.shareClassified: _AppMessageDefaults.shareClassified,
    AppMessageKeys.qualifications: _AppMessageDefaults.qualifications,
    AppMessageKeys.whatsAppNumberNotFound:
        _AppMessageDefaults.whatsAppNumberNotFound,
    AppMessageKeys.whatsAppDefault: _AppMessageDefaults.whatsAppDefault,
    AppMessageKeys.bestDeal: _AppMessageDefaults.bestDeal,
  };

  AppMessagesManager._();

  /// This will be the actual map we will use to display the app messages in the UI,
  static Map<String, String> _appMessages = {};

  /// This function will be directly used in the UI to access the loaded app messages.
  static String getMessage(String key) {
    if (_appMessages.containsKey(key)) {
      return _appMessages[key]!;
    }
    return _defaultMessages[key]!;
  }

  /// This function will be called when the app is started, it will get the app messages
  /// from the [IAppMessageRepository] at the time when the app is started.
  static Future<void> loadAppMessages() async {
    print(jsonEncode(_defaultMessages));
    IAppMessageRepository _appMessageRepository = sl<IAppMessageRepository>();
    await _appMessageRepository.loadAllAppMessages();
    List<AppMessage> all = _appMessageRepository.allAppMessages;
    all.forEach((element) {
      _appMessages[element.key!] = element.message!;
    });
  }
}

/// This class will hold the values for all the keys we need to use across the app.
class AppMessageKeys {
  AppMessageKeys._();
  static const String update = "update_key";
  static const String bestDeal = "bestDeal";
  static const String sendFeeback = "sendFeeback";
  static const String phoneNumber = "phoneNumber";
  static const String whatsAppDefault = "whatsAppDefault";
  static const String whatsAppNumberNotFound = "whatsAppNumberNotFound";
  static const String email = "email";
  static const String qualifications = "qualifications";
  static const String shareArticle = "shareArticle";
  static const String shareBanner = "shareBanner";
  static const String shareClassified = "shareClassified";
}

/// This class will hold all the default messages for the application in case the value fails from the API
class _AppMessageDefaults {
  _AppMessageDefaults._();
  static const update =
      "This version is no longer supported, please update the application before using.";
  static const String whatsAppNumberNotFound =
      "This business has not listed any whatsApp contact number.";
  static const String qualifications = "Xth, XIIth, Graduate, P.G., P.hD, N/A";

  static const String bestDeal =
      "Your requirement is sent to relevent businesses \nBusinesses compete with each other to get you the Best Deal";

  static const String whatsAppDefault =
      "Hi, found ${ConstantStrings.classifiedNameTemplateString} on AskMe, can you please help me with your service.";
  static const String sendFeeback =
      "Click on the below link to reach us ${ConstantStrings.classifiedAddressTemplateString} ${ConstantStrings.classifiedContactTemplateString}";
  static const String phoneNumber = "9876543210";
  static const String email = "admin@askmegroup.in";
  static const String shareArticle =
      "Share ${ConstantStrings.articleTemplateString} ${ConstantStrings.urlTemplateString}";
  static const String shareBanner =
      "Share ${ConstantStrings.bannerTemplateString}";
  static const String shareClassified =
      "Share ${ConstantStrings.classifiedNameTemplateString} ${ConstantStrings.classifiedAddressTemplateString} ${ConstantStrings.classifiedContactTemplateString}";
}
