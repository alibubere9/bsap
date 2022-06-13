import 'package:classified_app/global/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmmer extends StatelessWidget {
  final Widget? child;
  final int? count;
  final bool? isGrid;
  const BaseShimmmer(
      {Key? key, this.child, this.count = 10, this.isGrid = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return isGrid!
        ? GridView.count(
            crossAxisCount: 4,
            children: List.generate(
                8,
                (_) => Shimmer.fromColors(
                      baseColor: Theme.of(context).scaffoldBackgroundColor,
                      highlightColor: Colors.grey,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.black,
                              height: height / 30,
                              width: width / 12,
                            ),
                            SpaceHeightWithValue(height: 5),
                            Container(
                              color: Colors.black,
                              height: height / 100,
                              width: width / 7,
                            ),
                          ],
                        ),
                      ),
                    )),
          )
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: count,
            itemBuilder: (context, _) => Shimmer.fromColors(
                child: (this.child != null)
                    ? child!
                    : Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.black,
                              height: height / 15,
                              width: width / 7,
                            ),
                            SpaceWidthWithValue(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.green,
                                  height: height / 55,
                                  width: width / 1.8,
                                ),
                                SpaceHeightWithValue(height: 5),
                                Container(
                                  color: Colors.black,
                                  height: height / 70,
                                  width: width / 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                baseColor: Theme.of(context).scaffoldBackgroundColor,
                highlightColor: Colors.grey.shade300),
          );
  }
}
