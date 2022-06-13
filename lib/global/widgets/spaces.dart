import 'package:flutter/material.dart';

class SpaceHeightWithValue extends StatelessWidget {
  /// Pass the desired [height] as a parameter and get the desired space in the [UI].
  final double height;

  const SpaceHeightWithValue({Key? key, required this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
      );
}

class SpaceWidthWithValue extends StatelessWidget {
  /// Pass the desired [width] as a parameter and get the desired space in the [UI].
  final double width;

  const SpaceWidthWithValue({Key? key, required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 0,
        width: width,
      );
}

class Space extends StatelessWidget {
  const Space({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpaceHeightWithValue(height: 25),
        Divider(height: 2, color: Theme.of(context).primaryColor),
        SpaceHeightWithValue(height: 25),
      ],
    );
  }
}
