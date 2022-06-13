import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/update_dialog.dart';
import 'package:classified_app/ui/banner-ad/bloc/banner_bloc.dart';
import 'package:classified_app/ui/home/home.dart';
import 'package:classified_app/ui/login/login_page.dart';
import 'package:classified_app/ui/notifications/bloc/notification_bloc.dart';
import 'package:classified_app/ui/register_user/register_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/user_bloc.dart';

class ConditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is NewUserState) {
          return SignUpPage();
        } else if (state is RegisteredUserState) {
          BlocProvider.of<BannerBloc>(context).add(LoadBanner());
          BlocProvider.of<NotificationBloc>(context).add(GettingListEvent());
          return Dashboard();
        } else if (state is Unauthenticated) {
          return LoginPage();
        } else if (state is ForceUpdateState) {
          return UpdateScreen();
        } else {
          return Dashboard();
        }
      });
    });
  }
}
