import 'dart:async';

import 'package:classified_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan/scan.dart';

class ScanMeterEntry extends StatefulWidget {
  int? index;
  List<TextEditingController>? barcodeControllerList;
  ScanMeterEntry({Key? key, this.index, this.barcodeControllerList})
      : super(key: key);

  @override
  State<ScanMeterEntry> createState() => _ScanMeterEntryState();
}

class _ScanMeterEntryState extends State<ScanMeterEntry> {
  ScanController controller = ScanController();
  Timer? timer;
  String qrcode = 'Unknown';

  @override
  void initState() {
    timer = Timer(
      const Duration(seconds: 10),
      () {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text(
                    'No Barcode Detected!!'), // To display the title it is optional
                content: Text(
                    'Please Scan Again...'), // Message which will be pop up on the screen
                // Action widget which will provide the user to acknowledge the choice
                actions: [
                  // TextButton(
                  //   // FlatButton widget is used to make a text to work like a button
                  //   //textColor: Colors.black,
                  //   onPressed: () {
                  //     NavRouter.navKey!.currentState!.pop();
                  //   }, // function used to perform after pressing the button
                  //   child: Text('Scan Again'),
                  // ),
                  TextButton(
                    // textColor: Colors.black,
                    onPressed: () {
                      NavRouter.navKey!.currentState!.pop();
                      NavRouter.navKey!.currentState!.pop();
                    },
                    child: Text('Go Back'),
                  ),
                ],
              )),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scanning...",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width, // custom wrap size
              height: MediaQuery.of(context).size.height / 1.4,
              child: ScanView(
                controller: controller,
// custom scan area, if set to 1.0, will scan full area
                scanAreaScale: 1,
                scanLineColor: Colors.green.shade400,
                onCapture: (data) async {
                  try {
                    print(data);
                    List<String> textList = [];
                    for (var element in widget.barcodeControllerList!) {
                      textList.add(element.text);
                    }
                    bool hasBarcode = textList.contains(data);
                    if (hasBarcode) {
                      showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: Text(
                                  'Barcode Already Scanned!!'), // To display the title it is optional
                              content: Text(
                                  'Please Scan Again...'), // Message which will be pop up on the screen
                              // Action widget which will provide the user to acknowledge the choice
                              actions: [
                                TextButton(
                                  // textColor: Colors.black,
                                  onPressed: () {
                                    NavRouter.navKey!.currentState!.pop("");
                                    NavRouter.navKey!.currentState!.pop("");
                                  },
                                  child: Text('Go Back'),
                                ),
                              ],
                            )),
                      );

                      // NavRouter.navKey!.currentState!.pop("");
                    } else {
                      BlocProvider.of<MeterEntryBloc>(context).add(
                          SendBarcodeNumberEvent(
                              barcodeNumber: data, index: widget.index));
                      NavRouter.navKey!.currentState!.pop(data);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
            //Text(timer!.tick.toString())
          ],
        ),
      ),
    );
  }
}
