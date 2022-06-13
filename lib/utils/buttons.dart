import 'package:flutter/material.dart';

Widget submitButton(
  Function()? callback,
  BuildContext context,
  String text,
) {
  return Container(
    height: 45,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withAlpha(190)
            ])),
    child: MaterialButton(
      height: 45,
      minWidth: MediaQuery.of(context).size.width,
      elevation: 4,
      hoverElevation: 20,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)),
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
