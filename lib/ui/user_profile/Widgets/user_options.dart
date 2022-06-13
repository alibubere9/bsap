import 'package:flutter/material.dart';

class UserProfileOptions extends StatelessWidget {
  final IconData? icon;
  final Function? onTap;
  const UserProfileOptions({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 22,
              child: Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
