import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final String? text;

  const Contacts({this.icon, this.text, this.hintText});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Icon(
                icon,
                size: 16,
                color: Theme.of(context).primaryColor,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hintText!,
                style: TextStyle(color: Colors.blueGrey),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                text!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}
