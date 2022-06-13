import 'dart:convert';
import 'package:classified_app/data/models/notification_model.dart';
import 'package:classified_app/data/models/notification_viewed.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';
import 'package:classified_app/services/interfaces/i_user_service.dart';

import 'interfaces/i_notification_repo.dart';

class NotificationRepository extends INotificationRepository {
  final ExecutionHandler _handler;
  final IUserService userService;

  NotificationRepository(
    this._handler,
    this.userService,
  );

  Future<List<NotificationModel>> get notificationsLists async {
    String response = await _handler.getNotificationsList(userService.userId);
    List<NotificationModel> notificationsList = _convertToModel(response);
    //  MockNotifications.notificationList;

    return notificationsList;
  }

  Future<void> notificationViewed(int? notificationId, bool isViewed) async {
    await _handler.notificationViewed(NotificationViewedModel(
        isViewed: isViewed,
        notificationId: notificationId,
        userId: userService.userId));
  }

  List<NotificationModel> _convertToModel(String response) {
    List plain = jsonDecode(response);
    List<NotificationModel> _notifications = [];
    plain.forEach((element) {
      _notifications.add(NotificationModel.fromMap(element));
    });
    return _notifications;
  }
}
