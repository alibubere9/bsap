import 'package:classified_app/ui/user/bloc/user_bloc.dart';
import 'package:classified_app/utils/name_abbrievation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImage extends StatelessWidget {
  final double? fontSize;
  const ProfileImage({Key? key, this.radius = 15, this.fontSize})
      : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is RegisteredUserState) {
          return (state.user.image != null && state.user.image!.isNotEmpty)
              ? CircleAvatar(
                  radius: radius,
                  backgroundImage: NetworkImage(state is RegisteredUserState
                      ? state.user.image ??
                          'https://images.indianexpress.com/2021/01/NASA-Black-hole.jpg'
                      : 'https://images.indianexpress.com/2021/01/NASA-Black-hole.jpg'),
                )
              : CircleAvatar(
                  radius: radius,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    StringFunctions.abbrievate(state.user.username!),
                    style: TextStyle(color: Colors.white, fontSize: fontSize),
                  ),
                );
        }
        return CircleAvatar();
      },
    );
  }
}
