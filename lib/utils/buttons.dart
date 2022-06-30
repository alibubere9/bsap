import 'package:flutter/material.dart';

Widget submitButton(
  Function()? callback,
  BuildContext context,
  String text,
) {
  return MaterialButton(
    color: Theme.of(context).primaryColor,
    elevation: 10,
    height: 45,
    minWidth: MediaQuery.of(context).size.width,
    shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0)),
    onPressed: callback,
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
