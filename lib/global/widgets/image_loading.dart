import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoading extends StatelessWidget {
  final double height, width;
  const ImageLoading({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        highlightColor: Theme.of(context).scaffoldBackgroundColor,
        baseColor: Colors.grey.shade200,
        // period: const Duration(seconds: 15),
        child: Container(
          color: Colors.black,
          width: width,
          height: 300,
        ),
      ),
    );
  }
}
