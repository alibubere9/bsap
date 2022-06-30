import 'package:classified_app/data/enums/module_type_enum.dart';
import 'package:classified_app/data/models/company_role_model.dart';
import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/company_selection/bloc/company_selection_bloc.dart';
import 'package:classified_app/ui/login/login_page.dart';
import 'package:classified_app/ui/module_type/bloc/module_selection_bloc.dart';
import 'package:classified_app/ui/role_selection/bloc/role_selection_bloc.dart';
import 'package:classified_app/utils/name_abbrievation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global/auth/bloc/authentication_bloc.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int co = 0;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return (state is Unauthenticated)
            ? LoginPage()
            : Scaffold(
                appBar: AppBar(title: const Text("Companies")),
                body: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade400),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: EdgeInsets.all(20),
                    child: BlocBuilder<CompanySelectionBloc, CompanySelectionState>(
                      builder: (context, state) {
                        return (state is SelectRoleOnPageTwo)
                            ? SingleChildScrollView(
                                child: Column(children: [
                                const Logo(width: 100),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                      "Choose a Role for ${state.companyName}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 28)),
                                ),
                                Container(
                                    height: 350,
                                    child: ListView.builder(
                                        itemCount: state.rolesList!.length,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: ((context, index) {
                                          co += 1;
                                          String companyName =
                                              state.companyName!;
                                          // List<RoleModel> rolesList = state
                                          //     .companyRoleModel!.companies![index].roles!;
                                          // String? roleNames =
                                          //     state.cprlViewModel![index].roleNames!;
                                          // int lastIndex =
                                          //     rolesList.indexOf(rolesList.last);
                                          return GestureDetector(
                                            onTap: () {
                                              int moduleType =
                                                  state.moduleType!;

                                              if (ModuleType
                                                          .values[moduleType] ==
                                                      ModuleType.textile ||
                                                  ModuleType
                                                          .values[moduleType] ==
                                                      ModuleType.sizing) {
                                                // BlocProvider.of<AuthenticationBloc>(
                                                //         context)
                                                //     .add(AppStarted());
                                                NavRouter.navKey!.currentState!
                                                    .pushReplacementNamed(
                                                        RouteStrings.Dashboard);
                                              } else {
                                                BlocProvider.of<
                                                            CompanySelectionBloc>(
                                                        context)
                                                    .add(SelectModuleEvent(
                                                      moduleValue: 
                                                        state.moduleType));
                                                // NavRouter.navKey!.currentState!
                                                //     .pushReplacementNamed(
                                                //         RouteStrings
                                                //             .ModuleSelectionList);
                                              }
                                            },
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: Container(
                                                    child: Text(
                                                      state.rolesList![index],
                                                      style: TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                  ),
                                                  // subtitle: Text(roleNames),
                                                  leading: CircleAvatar(
                                                    radius: 21,
                                                    child: CircleAvatar(
                                                        radius: 20,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: Text(
                                                          StringFunctions
                                                              .abbrievate(state
                                                                      .rolesList![
                                                                  index]),
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        )),
                                                  ),
                                                ),
                                                (co == state.rolesList!.length)
                                                    ? Container()
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 28),
                                                        child: Divider(
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                              ],
                                            ),
                                          );
                                        })))
                              ]))
                            : Container();
                      },
                    ),
                  ),
                ),
              );
      },
    );
  }
}
