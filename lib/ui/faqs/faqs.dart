import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bloc/faqs_bloc.dart';

class Faqs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          'FAQ\'s',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: BlocBuilder<FaqsBloc, FaqsState>(
        builder: (context, state) {
          return (state is FaqsLoaded)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Frequently Asked Questions.',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      (state.faqsList!.isEmpty)
                          ? Container(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height / 3.5),
                              child: Center(
                                child: Text(
                                  'Contact the system administrator for any help.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.faqsList!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.4),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(6)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 3),
                                    child: ExpansionTile(
                                      childrenPadding:
                                          EdgeInsets.symmetric(vertical: 9),
                                      leading: Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(
                                          FontAwesomeIcons.questionCircle,
                                          size: 20,
                                        ),
                                      ),
                                      title: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(right: 8),
                                        child: Text(
                                          state.faqsList![index].question,
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      children: [
                                        ListTile(
                                          leading: Container(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text('Answer:',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.4),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          title: Container(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              state.faqsList![index].answer,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),

                                        // Container(
                                        //   padding: EdgeInsets.only(left: 15,right: 15),
                                        //   width: double.infinity,
                                        //   child: Text(
                                        //     _faqs[index].answer,
                                        //     textAlign: TextAlign.center,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                      SizedBox(
                        height: 15,
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
