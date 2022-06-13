part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationLoading extends NotificationState {}

class GetNotificationList extends NotificationState {
  final String? color;
  final List<NotificationModel>? notificationsList;

  GetNotificationList({this.notificationsList,this.color});
  @override
  List<Object?> get props => [notificationsList];
}
