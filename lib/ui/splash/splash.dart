import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(
                width: width * .7,
              ),
              const SpaceHeightWithValue(height: 25),
              Container(width: width * .7, child: const LinearProgressIndicator()),
              const SpaceHeightWithValue(height: 10),
              const Text('Please wait...')
            ],
          ),
        ),
      ),
    );
  }
}
