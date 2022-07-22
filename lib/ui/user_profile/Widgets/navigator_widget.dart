import 'package:classified_app/ui/user_profile/Widgets/user_options.dart';
import 'package:flutter/material.dart';

import 'option_text.dart';

class NavigatorWidget extends StatelessWidget {
  final IconData? icon;
  final String? constString;
  final Function? onTap;
  NavigatorWidget({this.icon, this.constString, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserProfileOptions(
          icon: icon,
          onTap: onTap,
        ),
        SizedBox(
          height: 8,
        ),
        OptionText(
          text: constString,
        ),
      ],
    );
  }
}
