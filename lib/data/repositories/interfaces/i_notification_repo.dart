import 'package:classified_app/data/models/notification_model.dart';

abstract class INotificationRepository {
  Future<List<NotificationModel>> get notificationsLists;
  Future<void> notificationViewed(int? notificationId, bool isViewed);
}