import 'package:classified_app/const/padding.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Color? color;
  const RoundButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ConstPadding.all12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color!, width: 0.5),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: color,
        ),
        onPressed: onPressed as void Function()?,
      ),
    );
  }
}
