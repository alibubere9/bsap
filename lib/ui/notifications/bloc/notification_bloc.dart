import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/notification_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_notification_repo.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  INotificationRepository notificationRepository;
  NotificationBloc(
    this.notificationRepository,
  ) : super(NotificationLoading());

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is GettingListEvent) {
      yield NotificationLoading();
      List<NotificationModel> notificationsList =
          await notificationRepository.notificationsLists;
      yield GetNotificationList(notificationsList: notificationsList);
    } else if (event is NotificationViewedEvent) {
      yield NotificationLoading();
      await notificationRepository.notificationViewed(
          event.notificationId, event.isViewed);
      List<NotificationModel> notificationsList =
          await notificationRepository.notificationsLists;
      yield GetNotificationList(notificationsList: notificationsList);
    }
  }
}
