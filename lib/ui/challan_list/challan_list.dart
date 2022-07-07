import 'package:classified_app/data/models/challan_model.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/challan_list/bloc/challan_bloc.dart';
import 'package:classified_app/ui/meter_entry/bloc/meter_entry_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallanList extends StatefulWidget {
  const ChallanList({Key? key}) : super(key: key);

  @override
  State<ChallanList> createState() => _ChallanListState();
}

class _ChallanListState extends State<ChallanList> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Select a Challan",
          style: TextStyles.style16w800.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(0.0),
        child: BlocBuilder<ChallanBloc, ChallanState>(
          builder: (context, state) {
            if (state is ChallanLoaded) {
              return Column(
                children: state.challans
                    .map((e) => GestureDetector(
                          onTap: () {
                            BlocProvider.of<ChallanBloc>(context).selected = e;
                            NavRouter.navKey!.currentState!
                                .pushNamed(RouteStrings.MeterEntry);
                          },
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: w / 1.5,
                                          child: Text(
                                            e.challanNo.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                        Container(
                                          width: w / 1.5,
                                          child: Text(
                                            e.party.toString().toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: w / 1.5,
                                          child: Text(
                                            e.item.toString() +
                                                " (${e.desgin.toString()})",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Text(
                                        e.pcs.toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ))
                    .toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
