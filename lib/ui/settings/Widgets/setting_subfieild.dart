import 'package:flutter/material.dart';

class SettingsField extends StatelessWidget {
  final String fieldText;
  final String fieldSubText;
  final void Function()? onTap;
  const SettingsField(this.fieldText, this.fieldSubText, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (fieldSubText.isNotEmpty) ? 60 : 40,
      child: ListTile(
        onTap: onTap,
        title: Text(
          fieldText,
          style: TextStyle(fontSize: 17),
        ),
        subtitle: (fieldSubText.isNotEmpty)
            ? Text(
                fieldSubText,
              )
            : null,
      ),
    );
  }
}
