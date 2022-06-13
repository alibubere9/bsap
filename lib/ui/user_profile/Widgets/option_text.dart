import 'package:flutter/material.dart';

class OptionText extends StatelessWidget {
  final String? text;

  const OptionText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400));
  }
}