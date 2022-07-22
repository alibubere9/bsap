import 'dart:developer';

import 'package:classified_app/data/models/meter_entry_model.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/challan_list/bloc/challan_bloc.dart';
import 'package:classified_app/ui/challan_meter_entry/bloc/meter_entry_bloc.dart';
import 'package:classified_app/ui/challan_meter_entry/scan_challan_meter_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MeterEntry extends StatefulWidget {
  const MeterEntry({Key? key}) : super(key: key);

  @override
  State<MeterEntry> createState() => _MeterEntryState();
}

class _MeterEntryState extends State<MeterEntry> {
  int pcs = 0;
  void _generate(int pcs) {
    int remainder = (pcs % perPageConst);
    if (remainder == 0) {
      lastPage = (pcs ~/ 5);
    } else {
      lastPage = (pcs / 5).toDouble().ceil();
    }
    print(lastPage);

    List.generate(pcs, (index) {
      takhaNoController.add(TextEditingController(text: ""));
      meterController.add(TextEditingController(text: ""));
      barcodeNoController.add(TextEditingController(text: ""));
      noOfTPController.add(TextEditingController(text: ""));
      weightController.add(TextEditingController(text: ""));
      remarkController.add(TextEditingController(text: ""));
      entry.add(MeterEntryModel(srNo: index + 1));
    });
  }

  @override
  void initState() {
    pcs = BlocProvider.of<ChallanBloc>(context).selected.pcs ?? 0;
    _generate(pcs);
    _paginate(pgNo);
    super.initState();
  }

  int pgNo = 1;
  int perPageConst = 5;
  List<MeterEntryModel> entry = [];
  int initialIndex = 0;
  int lastIndex = 4;
  int lastPage = 1;

  void _paginate(int pgNo) {
    int lastpageLength = 5;
    if (pcs % perPageConst != 0) {
      lastpageLength = pcs % perPageConst;
    }
    if (pgNo == lastPage) {
      lastIndex = pcs - 1; //14
      initialIndex = perPageConst * (pgNo - 1);
    } else {
      lastIndex = (pgNo * (pcs > perPageConst ? perPageConst : pcs)) - 1;
      initialIndex =
          (lastIndex > perPageConst ? lastIndex + 1 - perPageConst : 0);
    }

    print("lastIndex: $initialIndex");
    setState(() {});
  }

  List<TextEditingController> takhaNoController = [];
  List<TextEditingController> meterController = [];
  List<TextEditingController> barcodeNoController = [];
  List<TextEditingController> noOfTPController = [];
  List<TextEditingController> weightController = [];
  List<TextEditingController> remarkController = [];
  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded = false;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Meter Entry",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
                children: entry.sublist(initialIndex, lastIndex + 1).map((e) {
              int index = entry.indexWhere((element) => element.srNo == e.srNo);
              return MeterEntryWidget(
                  takhaNoController: takhaNoController,
                  index: index,
                  meterController: meterController,
                  barcodeNoController: barcodeNoController,
                  noOfTPController: noOfTPController,
                  weightController: weightController,
                  remarkController: remarkController);
            }).toList()),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (pgNo != 1) {
                            pgNo--;
                            _paginate(pgNo);
                          }
                        },
                        style: (pgNo == 1)
                            ? ElevatedButton.styleFrom(
                                primary: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.45))
                            : ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                        child: Container(
                            height: 35,
                            width: 75,
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.stepBackward, size: 18),
                                SizedBox(
                                  width: 2,
                                ),
                                Center(child: Text("Previous")),
                              ],
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "...",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Text(
                        pgNo.toString(),
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "...",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (pgNo != lastPage) {
                            pgNo++;
                            _paginate(pgNo);
                          } else {
                            for (int i = 0; i < entry.length; i++) {
                              entry[i].takhaNo = takhaNoController[i].text;
                              entry[i].weight = weightController[i].text;
                              entry[i].meter = meterController[i].text;
                              entry[i].barCode = barcodeNoController[i].text;
                              entry[i].numberOfTP = noOfTPController[i].text;
                              entry[i].remark = remarkController[i].text;
                            }
                            log(entry.toString());
                            BlocProvider.of<MeterEntryBloc>(context).add(
                                GetToSubmissionReviewPage(
                                    meterEntryList: entry));
                            NavRouter.navKey!.currentState!
                                .pushNamed(RouteStrings.SubmissionReview);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        child: Container(
                            height: 35,
                            width: 65,
                            child: (pgNo == lastPage)
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Center(child: Text("Submit")),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 7),
                                        child: Icon(FontAwesomeIcons.thumbsUp,
                                            size: 18),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Center(child: Text("Next")),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Icon(FontAwesomeIcons.stepForward,
                                          size: 18),
                                    ],
                                  )))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class MeterEntryWidget extends StatelessWidget {
  const MeterEntryWidget({
    Key? key,
    required this.takhaNoController,
    required this.index,
    required this.meterController,
    required this.barcodeNoController,
    required this.noOfTPController,
    required this.weightController,
    required this.remarkController,
  }) : super(key: key);

  final List<TextEditingController> takhaNoController;
  final int index;
  final List<TextEditingController> meterController;
  final List<TextEditingController> barcodeNoController;
  final List<TextEditingController> noOfTPController;
  final List<TextEditingController> weightController;
  final List<TextEditingController> remarkController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MeterEntryBloc, MeterEntryState>(
      listener: (context, state) {
        if (state is MeterEntryByBarcodeState) {
          barcodeNoController[state.index!].text = state.meterEntry!.barCode!;
          takhaNoController[state.index!].text = state.meterEntry!.takhaNo!;
          meterController[state.index!].text = state.meterEntry!.meter!;
          noOfTPController[state.index!].text = state.meterEntry!.numberOfTP!;
          remarkController[state.index!].text = state.meterEntry!.remark!;
          weightController[state.index!].text = state.meterEntry!.weight!;
        }
      },
      child: Card(
        borderOnForeground: true,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Stack(
          children: [
            //Text(e.srNo.toString()),
            ExpansionTile(
              childrenPadding: EdgeInsets.symmetric(vertical: 0),
              tilePadding: EdgeInsets.all(1),
              collapsedTextColor: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryColor,
              iconColor: Theme.of(context).primaryColor,
              title: Container(
                height: 30,
                //padding: EdgeInsets.only(right: 150),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Takha No:",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.5),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 112,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        cursorColor: Theme.of(context).primaryColor,
                        controller: takhaNoController[index],
                        onTap: () {
                          takhaNoController[index].text = "0";
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: "Enter Takha No.",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14.5)),
                      ),
                    ),
                    //
                  ],
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute<String>(
                          builder: (BuildContext context) => ScanMeterEntry(
                              index: index,
                              barcodeControllerList: barcodeNoController),
                        ),
                      );
                      barcodeNoController[index].text = result.toString();
                    },
                    child: Icon(Icons.qr_code_scanner_sharp)),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Text(
                              "Meter:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14.5),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 30,
                              width: 75,
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                cursorColor: Theme.of(context).primaryColor,
                                controller: meterController[index],
                                onTap: () {
                                  meterController[index].text = "0";
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    hintText: "Enter Meter",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.5)),
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Barcode No:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14.5),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 30,
                              width: 120,
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                cursorColor: Theme.of(context).primaryColor,
                                controller: barcodeNoController[index],
                                onTap: () {
                                  barcodeNoController[index].text = "0";
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    hintText: "Enter Barcode No.",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.5)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "No. of TP:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14.5),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 30,
                            width: 111,
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              cursorColor: Theme.of(context).primaryColor,
                              controller: noOfTPController[index],
                              onTap: () {
                                noOfTPController[index].text = "0";
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  hintText: "Enter No.",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.5)),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Weight:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14.5),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 30,
                            width: 92,
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              cursorColor: Theme.of(context).primaryColor,
                              controller: weightController[index],
                              onTap: () {
                                weightController[index].text = "0";
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  hintText: "Enter Weight",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.5)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          cursorColor: Theme.of(context).primaryColor,
                          controller: remarkController[index],
                          onTap: () {
                            remarkController[index].text =
                                "The remark for this is.";
                          },
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Write Remark",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
