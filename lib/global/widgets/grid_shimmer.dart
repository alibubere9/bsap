import 'package:classified_app/global/widgets/base_shimmer.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:flutter/material.dart';

class GridShimmer extends StatelessWidget {
  const GridShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BaseShimmmer(
      isGrid: true,
      count: 15,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              height: height / 50,
              width: width / 25,
            ),
            SpaceWidthWithValue(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.green,
                  height: height / 100,
                  width: width / 1.8,
                ),
                SpaceHeightWithValue(height: 5),
                Container(
                  color: Colors.black,
                  height: height / 120,
                  width: width / 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
