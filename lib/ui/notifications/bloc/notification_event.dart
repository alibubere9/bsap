part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class GettingListEvent extends NotificationEvent {
}

class NotificationViewedEvent extends NotificationEvent {
  final int? notificationId;
  final bool isViewed;
  NotificationViewedEvent({
    this.notificationId,
    required this.isViewed,
  });
  @override
  List<Object> get props => [notificationId!,isViewed];
}
