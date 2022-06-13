import 'package:classified_app/const/padding.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Function? onTap;
  const IconAndText({
    Key? key,
    this.text,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.grey,
            ),
            SpaceWidthWithValue(width: 10),
            Container(
              margin: ConstPadding.all12,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(text!),
            )
          ],
        ),
        Divider(
          height: 4,
        ),
      ],
    );
  }
}
