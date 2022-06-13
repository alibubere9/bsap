import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:classified_app/utils/app_messages.dart';
import 'package:classified_app/utils/launch_native.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Logo(
              width: 200,
            ),
            Center(
              child: Text(
                AppMessagesManager.getMessage(AppMessageKeys.update),
                style: TextStyles.style27bold,
              ),
            ),
            MaterialButton(
              onPressed: () {
                launchPlatforApp();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ])),
                width: double.infinity,
                height: 50,
                child: Text(
                  ConstantStrings.updateNow,
                  style: TextStyles.style27bold.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
