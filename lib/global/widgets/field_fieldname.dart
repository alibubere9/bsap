import 'package:flutter/material.dart';
import 'package:classified_app/const/padding.dart';

class FieldNameAndField extends StatelessWidget {
  final TextEditingController? controller;
  final String? text;
  final String? prefixText;
  final TextInputType? keyboardType;
  final Widget? prefixWidget;
  const FieldNameAndField(
      {this.controller,
      this.text,
      this.prefixWidget,
      this.prefixText,
      this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: ConstPadding.onlyl22,
          child: Text(
            text!,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          ),
        ),
        Container(
          padding: ConstPadding.symmH22,
          child: TextField(
            style: TextStyle(fontSize: 15),
            keyboardType: keyboardType,
            controller: controller,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              prefixText: prefixText,
              prefix: prefixWidget,
              isDense: true,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
