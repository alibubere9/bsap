import 'package:firebase_messaging/firebase_messaging.dart';

import 'interfaces/i_notification_service.dart';

class NotificationService implements INotificationService {
 final FirebaseMessaging _firebaseMessaging;

  NotificationService(this._firebaseMessaging);
  @override
  Future<String?> get token async {
    _firebaseMessaging.requestPermission();
   String? token = await _firebaseMessaging.getToken();
    return token;
  }
}
