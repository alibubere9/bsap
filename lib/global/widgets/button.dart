import 'package:flutter/material.dart';

import 'package:classified_app/const/padding.dart';

class Button extends StatelessWidget {
  final Function? onTap;
  final String? text;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final double fontSize;

  const Button({
    Key? key,
    this.onTap,
    this.text,
    this.bgColor = Colors.blue,
    this.textColor = Colors.blue,
    this.borderColor = Colors.white,
    this.fontSize = 19.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        width: double.maxFinite,
        padding: ConstPadding.symmH15V7,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          color: bgColor, //Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
