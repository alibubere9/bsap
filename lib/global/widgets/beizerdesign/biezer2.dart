import 'dart:math';
import 'package:classified_app/global/widgets/beizerdesign/clippainter.dart';
import 'package:flutter/material.dart';

class BezierDarkContainer extends StatelessWidget {
  const BezierDarkContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
      angle: pi * 1,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.red.withOpacity(1),
                Colors.red.withOpacity(0.8)
              ])),
        ),
      ),
    ));
  }
}
