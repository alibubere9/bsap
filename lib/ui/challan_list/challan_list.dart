import 'package:classified_app/data/models/challan_model.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:flutter/material.dart';

class ChallanList extends StatefulWidget {
  const ChallanList({Key? key}) : super(key: key);

  @override
  State<ChallanList> createState() => _ChallanListState();
}

class _ChallanListState extends State<ChallanList> {
  List<ChallanModel> challans = [
    ChallanModel.fromMap({
      "challan_no": 123456789,
      "party": "Ali Bubere",
      "item": "item name",
      "desgin": "Design",
      "Pcs": 50
    }),
    ChallanModel.fromMap({
      "challan_no": 123456789,
      "party": "Ali Bubere",
      "item": "item name",
      "desgin": "Design",
      "Pcs": 50
    }),
    ChallanModel.fromMap({
      "challan_no": 123456789,
      "party": "Ali Bubere",
      "item": "item name",
      "desgin": "Design",
      "Pcs": 50
    }),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: challans
              .map((e) => ListTile(
                    isThreeLine: true,
                    title: Text(
                      e.challanNo.toString(),
                      style: TextStyles.style16w800,
                    ),
                    subtitle: Text(
                      e.party.toString() + "\n${e.desgin}",
                      style: TextStyles.style14
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    trailing: Text(
                      e.pcs.toString(),
                      style: TextStyles.style14
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
