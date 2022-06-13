import 'package:classified_app/const/padding.dart';
import 'package:classified_app/global/widgets/base_shimmer.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:flutter/material.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseShimmmer(
      count: 1,
      child: Padding(
        padding: ConstPadding.all12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              height: 150,
              width: double.maxFinite,
            ),
            SpaceHeightWithValue(height: 10),
            Container(
              color: Colors.black,
              height: 20,
              width: 150,
            ),
            SpaceHeightWithValue(height: 10),
            Container(
              color: Colors.black,
              height: 20,
              width: 125,
            ),
            SpaceHeightWithValue(height: 10),
            Container(
              color: Colors.black,
              height: 20,
              width: 200,
            ),
            SpaceHeightWithValue(
              height: 15,
            ),
            Container(
              color: Colors.black,
              height: 40,
              width: double.maxFinite,
            ),
            SpaceHeightWithValue(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  color: Colors.black,
                  height: 150,
                  width: 200,
                ),
                SpaceWidthWithValue(width: 15),
                Container(
                  color: Colors.black,
                  height: 150,
                  width: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
