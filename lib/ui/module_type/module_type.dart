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

class ModuleSelection extends StatelessWidget {
  const ModuleSelection({Key? key}) : super(key: key);

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
                    child: BlocBuilder<CompanySelectionBloc,
                        CompanySelectionState>(
                      builder: (context, state) {
                        return (state is SelectModuleOnPageThree)
                            ? SingleChildScrollView(
                                child: Column(children: [
                                const Logo(width: 100),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text("Choose a Module Type",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 28)),
                                ),
                                Container(
                                    height: 350,
                                    child: ListView.builder(
                                        itemCount: state.modulesList!.length,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: ((context, index) {
                                          co += 1;
                                          //String companyName = state.companyName!;
                                          // List<RoleModel> rolesList = state
                                          //     .companyRoleModel!.companies![index].roles!;
                                          // String? roleNames =
                                          //     state.cprlViewModel![index].roleNames!;
                                          // int lastIndex =
                                          //     rolesList.indexOf(rolesList.last);
                                          return GestureDetector(
                                            onTap: () {
                                              BlocProvider.of<
                                                          AuthenticationBloc>(
                                                      context)
                                                  .add(AppStarted());
                                              NavRouter.navKey!.currentState!
                                                  .pushReplacementNamed(
                                                      RouteStrings.Dashboard);
                                            },
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: Container(
                                                    child: Text(
                                                      state.modulesList![index],
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
                                                                      .modulesList![
                                                                  index]),
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        )),
                                                  ),
                                                ),
                                                (co ==
                                                        state.modulesList!
                                                            .length)
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
