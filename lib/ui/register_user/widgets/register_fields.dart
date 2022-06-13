import 'package:classified_app/const/padding.dart';
import 'package:classified_app/utils/textfields_Utils.dart';
import 'package:flutter/material.dart';

class EditUsersWidget extends StatelessWidget {
  final String? hintText;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? fieldName;
  final void Function(String)? onChanged;
  final TextInputType? inputType;
  final Function? onEditingComplete;
  final Function? onTap;

  const EditUsersWidget(
      {this.hintText,
      this.onChanged,
      this.controller,
      this.fieldName,
      this.inputType,
      this.onEditingComplete,
      this.readOnly,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstPadding.t8r8b5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: ConstPadding.onlyl12,
            child: Text(fieldName!,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.5)),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 150.0, maxWidth: 180),
                child: RegisterTextField(
                  controller,
                  hintText,
                  TextAlign.right,
                  inputType,
                  onEditingComplete: onEditingComplete,
                  onTap: onTap,
                  readOnly: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
