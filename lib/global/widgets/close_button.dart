import 'package:flutter/material.dart';

import '../../router.dart';

class CloseButtonCircle extends StatelessWidget {
  const CloseButtonCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () {
          NavRouter.navKey!.currentState!.pop();
        });
  }
}
