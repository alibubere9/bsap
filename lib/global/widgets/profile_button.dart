import 'package:classified_app/global/widgets/profile_image.dart';
import 'package:classified_app/ui/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:classified_app/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          UserState userState = BlocProvider.of<UserBloc>(context).state;
          if (userState is RegisteredUserState) {
            NavRouter.navKey!.currentState!.pushNamed(RouteStrings.Profile);
          }
        },
        child: ProfileImage(
          fontSize: 14,
        ));
  }
}
