import 'package:classified_app/global/widgets/base_shimmer.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:flutter/material.dart';

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return BaseShimmmer(
      count: 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              height: 150,
              width: width * 0.8,
            ),
            SpaceHeightWithValue(height: 15),
            Container(
              color: Colors.green,
              height: 20,
              width: width * 0.8,
            ),
            SpaceHeightWithValue(height: 8),
            Container(
              color: Colors.green,
              height: 10,
              width: width * 0.8,
            ),
            SpaceHeightWithValue(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceWidthWithValue(width: 25),
                Container(
                  color: Colors.green,
                  height: 30,
                  width: 30,
                ),
                SpaceWidthWithValue(width: 5),
                Container(color: Colors.black, height: 30, width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
