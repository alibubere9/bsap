import 'package:classified_app/global/widgets/update_dialog.dart';
import 'package:classified_app/ui/home/home.dart';
import 'package:classified_app/ui/login/login_page.dart';
import 'package:classified_app/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'global/auth/bloc/authentication_bloc.dart';
import 'ui/user/bloc/user_bloc.dart';
import 'ui/user/condition_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is InitialAuthentication) {
          return SplashScreen();
        } else if (state is Unauthenticated) {
          return LoginPage();
        } else if (state is AuthenticatedState) {
          BlocProvider.of<UserBloc>(context).add(CheckUserEvent());
          return ConditionPage();
        } else if (state is AlreadyLoggedInState) {
          return Dashboard();
        } else if (state is ForceUpdateState) {
           return UpdateScreen();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
