import 'package:classified_app/ui/challan_meter_entry/bloc/meter_entry_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubmissionReview extends StatefulWidget {
  const SubmissionReview({Key? key}) : super(key: key);

  @override
  State<SubmissionReview> createState() => _SubmissionReviewState();
}

class _SubmissionReviewState extends State<SubmissionReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Meter Entry Review",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )),
      body: BlocBuilder<MeterEntryBloc, MeterEntryState>(
        builder: (context, state) {
          return (state is MeterEntryListState)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          itemCount: state.meterEntryList!.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Card(
                              borderOnForeground: true,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: Stack(
                                children: [
                                  //Text(e.srNo.toString()),
                                  ExpansionTile(
                                    childrenPadding:
                                        EdgeInsets.symmetric(vertical: 0),
                                    tilePadding: EdgeInsets.all(1),
                                    collapsedTextColor:
                                        Theme.of(context).primaryColor,
                                    textColor: Theme.of(context).primaryColor,
                                    iconColor: Theme.of(context).primaryColor,
                                    title: Container(
                                      height: 30,
                                      //padding: EdgeInsets.only(right: 150),
                                      child: Row(
                                        children: [
                                          Text("Takha No:"),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                              width: 112,
                                              child: Text(state
                                                  .meterEntryList![index]
                                                  .takhaNo
                                                  .toString())),
                                          //
                                        ],
                                      ),
                                    ),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Meter:",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 42,
                                                      child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                            state
                                                                .meterEntryList![
                                                                    index]
                                                                .meter!,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 16)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Barcode No:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 42,
                                                      child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                            state
                                                                .meterEntryList![
                                                                    index]
                                                                .barCode!,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 16)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "No. of TP:",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 42,
                                                      child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                            state
                                                                .meterEntryList![
                                                                    index]
                                                                .numberOfTP!,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 16)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Weight:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      width: 42,
                                                      child: FittedBox(
                                                        fit: BoxFit.none,
                                                        child: Text(
                                                            state
                                                                .meterEntryList![
                                                                    index]
                                                                .weight!,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 16)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blueGrey),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0)),
                                              ),
                                              child: (state
                                                      .meterEntryList![index]
                                                      .remark!
                                                      .isEmpty)
                                                  ? Center(
                                                      child: Text("No Remark",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16)),
                                                    )
                                                  : Text(state
                                                      .meterEntryList![index]
                                                      .remark!),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor),
                          child: Container(
                              height: 35,
                              width: 65,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Center(child: Text("Save")),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 7),
                                    child: Icon(FontAwesomeIcons.thumbsUp,
                                        size: 18),
                                  ),
                                ],
                              ))),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
