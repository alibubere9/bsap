import 'package:classified_app/const/padding.dart';
import 'package:flutter/material.dart';

import 'base_shimmer.dart';

class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseShimmmer(
      count: 1,
      child: Padding(
          padding: ConstPadding.all12,
          child: Column(
            children: [
              Container(
                  padding: ConstPadding.all8,
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          height: 150,
                          width: double.infinity),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          child: CircleAvatar(
                            radius: 72,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 12,
              ),
              Container(color: Colors.black, height: 30, width: 200),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: ConstPadding.symmH20V8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 22,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          color: Colors.black,
                          height: 12,
                          width: 40,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 22,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          color: Colors.black,
                          height: 12,
                          width: 40,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 22,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          color: Colors.black,
                          height: 12,
                          width: 40,
                        ),
                      ],
                    ),
                    //
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                  padding: ConstPadding.symmH20V5,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.black,
                                  height: 10,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 10,
                                  width: 150,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.black,
                                  height: 10,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 10,
                                  width: 100,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
