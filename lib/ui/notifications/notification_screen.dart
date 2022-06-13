import 'package:classified_app/const/padding.dart';
import 'package:classified_app/global/widgets/base_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/notification_bloc.dart';
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              'Notification',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          ),
          body: (state is GetNotificationList)
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: state.notificationsList!.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      trailing: Container(
                        width: 15,
                      ),
                      leading: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(26)),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 26,
                          child: (state.notificationsList![index].image == null)
                              ? Container(
                                  child: Text(
                                  state.notificationsList![index].title!
                                      .substring(0, 1),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ))
                              : Image.network(
                                  state.notificationsList![index].image!,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                ),
                        ),
                      ),
                      onExpansionChanged: (bool change) {
                        if (state.notificationsList![index].isViewed == false) {
                          BlocProvider.of<NotificationBloc>(context).add(
                              NotificationViewedEvent(
                                  isViewed: true,
                                  notificationId:
                                      state.notificationsList![index].id));
                        }
                      },
                      children: [Text("")],
                      collapsedBackgroundColor:
                          state.notificationsList![index].isViewed
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).primaryColor.withOpacity(0.2),
                      backgroundColor: state.notificationsList![index].isViewed
                          ? Theme.of(context).scaffoldBackgroundColor
                          : Theme.of(context).primaryColor.withOpacity(0.2),
                      title: Text(
                        state.notificationsList![index].title!,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight:
                                (state.notificationsList![index].isViewed)
                                    ? FontWeight.normal
                                    : FontWeight.w500),
                      ),
                      subtitle: Text(
                        state.notificationsList![index].text!,
                        style: TextStyle(
                            fontWeight:
                                (state.notificationsList![index].isViewed)
                                    ? FontWeight.normal
                                    : FontWeight.bold),
                      ),
                      tilePadding: ConstPadding.all8,
                    );
                  })
                  : BaseShimmmer()
              // : Loading(
              //     child: Center(
              //         child: Text(
              //       'No notifications found',
              //       style: TextStyle(fontSize: 25),
              //     )),)
                );
    });
  }
}
