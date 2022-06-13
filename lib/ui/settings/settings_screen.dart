import 'package:app_settings/app_settings.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/environment/environment.dart';
import 'package:classified_app/environment/tester.dart';
import 'package:classified_app/global/theme/bloc/theme_bloc.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widgets/setting_fields.dart';
import 'Widgets/setting_subfieild.dart';
import 'bloc/settings_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          ConstantStrings.settings,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            const SettingFieldText(
              text: ConstantStrings.userSettings,
            ),
            BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is RegisteredUserState) {
                return SettingsField(
                    ConstantStrings.displayName, state.user.username ?? '');
              } else {
                return Container();
              }
            }),
            const SizedBox(
              height: 8,
            ),
            const SettingFieldText(
              text: ConstantStrings.other,
            ),
            GestureDetector(
                onTap: () {
                  AppSettings.openAppSettings();
                },
                child: const SettingsField(
                    ConstantStrings.appInfo, ConstantStrings.systemInfoScreen)),
            // Divider(color: Colors.grey.withOpacity(0.6)),

            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return Visibility(
                  visible: (state is SettingsLoaded &&
                      state.environment == Environment.dev),
                  child: BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return SwitchListTile(
                          activeColor: Theme.of(context).primaryColor,
                          title: const Text('Dark Theme'),
                          value:
                              state.themeMode == ThemeMode.dark ? true : false,
                          onChanged: (val) {
                            BlocProvider.of<ThemeBloc>(context)
                                .add(ThemeEvent(val));
                          });
                    },
                  ),
                );
              },
            ),

            Divider(color: Colors.grey.withOpacity(0.6)),

            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return (state is SettingsLoaded)
                    ? GestureDetector(
                        onDoubleTap: () {
                          if (Tester.verify()) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Switch Environment?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            context
                                                .read<SettingsBloc>()
                                                .add(SwitchEnvironment());
                                          },
                                          child: Text('Yes'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            NavRouter.navKey!.currentState!
                                                .pop();
                                          },
                                          child: Text('No'),
                                        ),
                                      ],
                                    ));
                          }
                        },
                        child: SettingsField(
                            ConstantStrings.version, state.appVersion))
                    : Container();
              },
            ),
            Divider(color: Colors.grey.withOpacity(0.6)),

            SettingsField(
              ConstantStrings.copyright,
              '',
              onTap: () {
                NavRouter.navKey!.currentState!
                    .pushNamed(RouteStrings.Copyright);
              },
            ),
            Divider(color: Colors.grey.withOpacity(0.6)),

            SettingsField(
              ConstantStrings.termsAndcondition,
              '',
              onTap: () {
                NavRouter.navKey!.currentState!
                    .pushNamed(RouteStrings.TermsAndConditions);
              },
            ),
            Divider(color: Colors.grey.withOpacity(0.6)),

            SettingsField(
              ConstantStrings.privacyPolicy,
              '',
              onTap: () {
                NavRouter.navKey!.currentState!.pushNamed(RouteStrings.Privacy);
              },
            ),
            Divider(color: Colors.grey.withOpacity(0.6)),

            SettingsField(
              ConstantStrings.thirdPartyNoticies,
              '',
              onTap: () {
                NavRouter.navKey!.currentState!
                    .pushNamed(RouteStrings.ThirdPartyNotices);
              },
            ),
            //Divider(color: Theme.of(context).primaryColor.withOpacity(0.6)),
          ],
        ),
      ),
    );
  }
}
