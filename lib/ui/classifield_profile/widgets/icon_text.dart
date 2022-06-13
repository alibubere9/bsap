import 'package:classified_app/const/padding.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final void Function()? onTap;
  const IconAndText({
    Key? key,
    this.text,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
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
                  child: Text(
                    text!,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
            Divider(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
