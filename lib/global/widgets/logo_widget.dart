import 'package:flutter/material.dart';

import 'package:classified_app/const/image_paths.dart';
import 'package:classified_app/router.dart';

class Logo extends StatelessWidget {
  final double width;
  const Logo({
    Key? key,
    this.width = 90,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavRouter.navKey!.currentState!.popUntil((route) => route.isFirst);
      },
      child: Center(
        child: Image.asset(
          ImagePaths.logo,
          // fit: BoxFit.cover,
          width: width,
        ),
      ),
    );
  }
}
