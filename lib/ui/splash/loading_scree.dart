import 'package:classified_app/global/widgets/loading_indicator.dart';
import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(
              width: width * .7,
            ),
            Center(
              child: LoadingIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
