import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/ui/drawer/app_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const/icons.dart';
import '../../utils/hex_color_extension.dart';
import 'bloc/home_bloc.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return
            // (state is Unauthenticated)
            //     ? LoginPage()
            //     :
            Scaffold(
                appBar: _buildAppBar(context),
                drawer: AppDrawer(),
                body: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return (state is HomeLoaded)
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: ConstPadding.all12,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SpaceHeightWithValue(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.8)),
                                    width: 400,
                                    height: 170,
                                    child: const Center(
                                        child: Text(
                                      "...Dashboard...",
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    )),
                                  ),
                                  SizedBox(height: 10),
                                  GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 3 / 1.3,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                      itemCount: 5,
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: ListTile(
                                                minLeadingWidth: 12,
                                                leading: IconMap.copyColor(
                                                  IconMap.iconById(state
                                                      .entrySectionList![index]
                                                      .iconId)!,
                                                  size: 33,
                                                  color: (state
                                                              .entrySectionList![
                                                                  index]
                                                              .color !=
                                                          null)
                                                      ? ColorExtensions.fromHex(
                                                          state
                                                              .entrySectionList![
                                                                  index]
                                                              .color!)
                                                      : Theme.of(context)
                                                          .primaryColor,
                                                ),
                                                title: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0.0),
                                                  child: Text(
                                                      state
                                                          .entrySectionList![
                                                              index]
                                                          .name!,
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                                subtitle: Text(
                                                  state.entrySectionList![index]
                                                      .subName!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                )),
                                            decoration: BoxDecoration(
                                                //color: Colors.grey.withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                        );
                                      })
                                ],
                              ),
                            ),
                          )
                        : Container();
                  },
                ));
      },
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
    title: Logo(),
    actions: const [
      // ProfileButton(),
      SpaceWidthWithValue(
        width: 15,
      )
    ],
  );
}
