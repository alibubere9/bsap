import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/utils/app_messages.dart';
import 'package:classified_app/utils/launch_native.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ConstantStrings.contactUs,
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Center(
            child: Icon(
              FontAwesomeIcons.solidEnvelopeOpen,
              color: Colors.blue.shade700.withOpacity(0.8),
              size: 82,
            ),
          ),
          Padding(
            padding: ConstPadding.t28b15,
            child: Text(
              AppMessagesManager.getMessage(AppMessageKeys.sendFeeback),
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchEmail(
                  email: AppMessagesManager.getMessage(AppMessageKeys.email));
            },
            child: Text(
              AppMessagesManager.getMessage(AppMessageKeys.email),
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlue.shade600,
                  decoration: TextDecoration.underline),
            ),
          ),
          Padding(
            padding: ConstPadding.t28b20,
            child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue.shade700.withOpacity(0.8),
                child: Text(
                  'OR',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Text(ConstantStrings.callUsOn,
              style: TextStyle(
                fontSize: 20,
              )),
          Padding(
            padding: ConstPadding.l110t20r110,
            child: Container(
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(4),
              //     border: Border.all(color: Colors.blueGrey.shade200)),
              // padding: ConstPadding.all8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.phone,
                    size: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchCaller(
                          phone: AppMessagesManager.getMessage(
                              AppMessageKeys.phoneNumber));
                    },
                    child: Padding(
                      padding: ConstPadding.onlyl8,
                      child: Text(
                        AppMessagesManager.getMessage(
                            AppMessageKeys.phoneNumber),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
