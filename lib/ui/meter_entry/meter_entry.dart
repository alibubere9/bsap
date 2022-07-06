import 'package:classified_app/global/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MeterEntry extends StatefulWidget {
  const MeterEntry({Key? key}) : super(key: key);

  @override
  State<MeterEntry> createState() => _MeterEntryState();
}

class _MeterEntryState extends State<MeterEntry> {
  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded = false;
    return Scaffold(
      appBar: AppBar(title: Text("Meter Entry")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                itemCount: 5,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: ExpansionTile(
                      title: Text('ExpansionTile 3'),
                      subtitle: Text('Leading expansion arrow icon'),
                      controlAffinity: ListTileControlAffinity.leading,
                      children: <Widget>[
                        ListTile(title: Text('This is tile number 3')),
                      ],
                    ),
                  );
                }),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
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
                        "2",
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        child: Container(
                            height: 35,
                            width: 65,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Center(child: Text("Next")),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(FontAwesomeIcons.stepForward, size: 18),
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
