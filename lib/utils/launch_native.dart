import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

import 'system_settings.dart';

void launchWhatsApp({
  required String? phone,
  required String message,
}) async {
  phone = "+91" + phone!;
  String url() {
    if (Platform.isIOS) {
      return "https://wa.me/$phone/?text=${Uri.encodeComponent(message)}";
    } else {
      return "whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}";
    }
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}

void launchCaller({required String? phone}) async {
  String url() {
    return "tel://$phone";
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}

void launchEmail({
  String? email,
}) async {
  String url() {
    if (Platform.isIOS) {
      return "mailto:$email?subject=News&body=New%20plugin";
    } else {
      return "mailto:$email?subject=News&body=New%20";
    }
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}

void launchPlatforApp() {
  if (Platform.isIOS) {
    launch(SystemSettingManager.getSetting(SystemSettingsTypes.appStoreAppUrl));
  } else {
    launch(
        SystemSettingManager.getSetting(SystemSettingsTypes.playStoreAppUrl));
  }
}
