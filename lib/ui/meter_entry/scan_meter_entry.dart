import 'package:classified_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scan/scan.dart';

class ScanMeterEntry extends StatelessWidget {
  ScanMeterEntry({Key? key}) : super(key: key);
  ScanController controller = ScanController();
  String qrcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 250, // custom wrap size
        height: 250,
        child: ScanView(
          controller: controller,
// custom scan area, if set to 1.0, will scan full area
          scanAreaScale: 1,
          scanLineColor: Colors.green.shade400,
          onCapture: (data) {
            Future<String?> result = Scan.parse(data);
            NavRouter.navKey!.currentState!.pop(result);
          },
        ),
      ),
    );
  }
}
