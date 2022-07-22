import 'package:classified_app/global/theme/textstyle.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/bale_list/bloc/bales_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaleList extends StatefulWidget {
  const BaleList({Key? key}) : super(key: key);

  @override
  State<BaleList> createState() => _BaleListState();
}

class _BaleListState extends State<BaleList> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Select a Bale",
          style: TextStyles.style16w800.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(0.0),
        child: BlocBuilder<BalesListBloc, BalesListState>(
          builder: (context, state) {
            if (state is BalesListLoaded) {
              return Column(
                children: state.balesList
                    .map((e) => GestureDetector(
                          onTap: () {
                            BlocProvider.of<BalesListBloc>(context).selected =
                                e;
                            NavRouter.navKey!.currentState!
                                .pushNamed(RouteStrings.BaleMeterEntry);
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
                                            e.baleNo.toString(),
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
