import 'package:classified_app/const/padding.dart';
import 'package:flutter/material.dart';

class SettingFieldText extends StatelessWidget {
  final String? text;

  const SettingFieldText({this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          //color: Colors.blueGrey.withOpacity(0.2),
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.11),
              ),
          padding: ConstPadding.l18t8b8,
          child: Text(
            text!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
