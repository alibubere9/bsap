

import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/widgets/web_view_widget.dart';
import 'package:classified_app/utils/system_settings.dart';
import 'package:flutter/material.dart';
class Privacypolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ConstantStrings.privacyPolicy,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        elevation: 0,
      ),
      body: Container(
          child: Column(children: [
        Expanded(
            child: WebViewWidget(
          url: SystemSettingManager.getSetting(SystemSettingsTypes.privacyPolicy),
        )),
      ])),
    );
  }
}
