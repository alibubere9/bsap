import 'package:classified_app/data/models/jobber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/meter_actual_bloc.dart';

class MeterActualWidget extends StatefulWidget {
  MeterActualWidget({Key? key}) : super(key: key);

  @override
  State<MeterActualWidget> createState() => _MeterActualWidgetState();
}

class _MeterActualWidgetState extends State<MeterActualWidget> {
  List<Jobber> _jobbers = [];
  Jobber? _selected;
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocListener<MeterActualBloc, MeterActualState>(
      listener: (context, state) {
        if (state is JobeerLoaded) {
          setState(() {
            _jobbers = state.jobbers;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Meter Actual Entry")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: DropdownButton<Jobber>(
                            hint: Text("Select Jobber"),
                            items: _jobbers
                                .map((e) => DropdownMenuItem(
                                    value: e, child: Text(e.name ?? "")))
                                .toList(),
                            value: _selected,
                            onChanged: (v) {
                              setState(() {
                                _selected = v!;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InkWell(
                            onTap: () async {
                              date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1990),
                                      lastDate: DateTime.now()) ??
                                  DateTime.now();
                              setState(() {});
                            },
                            child: Container(
                                child: Text(date.toString().substring(0, 11)))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
