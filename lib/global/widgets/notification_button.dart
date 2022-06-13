import 'package:classified_app/router.dart';
import 'package:classified_app/ui/notifications/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Icon(
          (state is GetNotificationList &&
                  state.notificationsList!.any((element) => !element.isViewed))
              ? FontAwesomeIcons.solidBell
              : FontAwesomeIcons.bell,
          color: Theme.of(context).primaryColor,
        );
      },
    ), onPressed: () {
      BlocProvider.of<NotificationBloc>(context).add(GettingListEvent());
      NavRouter.navKey!.currentState!.pushNamed(RouteStrings.Notifications);
    });
  }
}
