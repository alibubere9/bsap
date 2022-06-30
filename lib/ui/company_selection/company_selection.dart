import 'package:classified_app/data/enums/module_type_enum.dart';
import 'package:classified_app/data/models/company_role_model.dart';
import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/company_selection/bloc/company_selection_bloc.dart';
import 'package:classified_app/ui/login/login_page.dart';
import 'package:classified_app/utils/name_abbrievation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global/auth/bloc/authentication_bloc.dart';

class CompanySelection extends StatefulWidget {
  const CompanySelection({Key? key}) : super(key: key);

  @override
  State<CompanySelection> createState() => _CompanySelectionState();
}

class _CompanySelectionState extends State<CompanySelection> {
  @override
  Widget build(BuildContext context) {
    int co = 0;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return (state is Unauthenticated)
            ? LoginPage()
            : BlocBuilder<CompanySelectionBloc, CompanySelectionState>(
                builder: (context, state) {
                  return WillPopScope(
                      onWillPop: () async {
                        if (state is SelectRoleOnPageTwo) {
                          BlocProvider.of<CompanySelectionBloc>(context)
                              .add(SelectCompanyEvent());
                        } else if (state is SelectModuleOnPageThree) {
                          if (BlocProvider.of<CompanySelectionBloc>(context)
                                  .isRoleSkipped ==
                              true) {
                            print("true");
                            BlocProvider.of<CompanySelectionBloc>(context)
                                .add(SelectCompanyEvent());
                          } else {
                            BlocProvider.of<CompanySelectionBloc>(context).add(
                                SelectRoleEvent(
                                    BlocProvider.of<CompanySelectionBloc>(
                                            context)
                                        .stringRoles,
                                    BlocProvider.of<CompanySelectionBloc>(
                                            context)
                                        .companyName,
                                    BlocProvider.of<CompanySelectionBloc>(
                                            context)
                                        .moduleValue));
                          }
                        } else {}
                        return false;
                      },
                      child: Scaffold(
                        appBar: AppBar(title: const Text("Companies")),
                        body: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Column(children: [
                                const Logo(width: 100),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                      (state is SelectCompanyOnPageOne)
                                          ? "Choose a company"
                                          : (state is SelectRoleOnPageTwo)
                                              ? "Choose a Role"
                                              : (state
                                                      is SelectModuleOnPageThree)
                                                  ? "Choose a Module Type"
                                                  : "Choose a Company",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 28)),
                                ),
                                Container(
                                    height: 350,
                                    child: (state is SelectCompanyOnPageOne)
                                        ? ListView.builder(
                                            itemCount: state.companyRoleModel!
                                                .companies!.length,
                                            shrinkWrap: true,
                                            physics: BouncingScrollPhysics(),
                                            itemBuilder: ((context, index) {
                                              String companyName = state
                                                  .companyRoleModel!
                                                  .companies![index]
                                                  .name!;
                                              List<RoleModel> rolesList = state
                                                  .companyRoleModel!
                                                  .companies![index]
                                                  .roles!;
                                              String? roleNames = state
                                                  .cprlViewModel![index]
                                                  .roleNames!;
                                              // int lastIndex =
                                              //     rolesList.indexOf(rolesList.last);
                                              return CRListWidget(
                                                rolesList: rolesList,
                                                roleNames: roleNames,
                                                companyName: companyName,
                                                lhsCompany: state
                                                    .companyRoleModel!
                                                    .companies![index],
                                                rhsCompany: state
                                                    .companyRoleModel!
                                                    .companies!
                                                    .last,
                                                onTapFunction: () {
                                                  int moduleType = state
                                                      .companyRoleModel!
                                                      .companies![index]
                                                      .moduleType!;

                                                  if (rolesList.length == 1) {
                                                    if (ModuleType.values[
                                                                moduleType] ==
                                                            ModuleType
                                                                .textile ||
                                                        ModuleType.values[
                                                                moduleType] ==
                                                            ModuleType.sizing) {
                                                      // NavRouter
                                                      //     .navKey!.currentState!
                                                      //     .popUntil((route) =>
                                                      //         route.isFirst);
                                                      // BlocProvider.of<
                                                      //             AuthenticationBloc>(
                                                      //         context)
                                                      //     .add(AppStarted());
                                                      NavRouter
                                                          .navKey!.currentState!
                                                          .pushReplacementNamed(
                                                              RouteStrings
                                                                  .Dashboard);
                                                    } else {
                                                      BlocProvider.of<
                                                                  CompanySelectionBloc>(
                                                              context)
                                                          .add(SelectModuleEvent(
                                                              isRoleSkipped:
                                                                  true,
                                                              moduleValue:
                                                                  moduleType));
                                                      print(state);
                                                    }
                                                  } else {
                                                    BlocProvider.of<
                                                                CompanySelectionBloc>(
                                                            context)
                                                        .add(SelectRoleEvent(
                                                            roleNames,
                                                            state
                                                                .cprlViewModel![
                                                                    index]
                                                                .companyName,
                                                            state
                                                                .companyRoleModel!
                                                                .companies![
                                                                    index]
                                                                .moduleType));
                                                  }
                                                },
                                              );
                                            }),
                                          )
                                        : (state is SelectRoleOnPageTwo)
                                            ? ListView.builder(
                                                itemCount:
                                                    state.rolesList!.length,
                                                shrinkWrap: true,
                                                physics:
                                                    BouncingScrollPhysics(),
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

                                                      if (ModuleType.values[
                                                                  moduleType] ==
                                                              ModuleType
                                                                  .textile ||
                                                          ModuleType.values[
                                                                  moduleType] ==
                                                              ModuleType
                                                                  .sizing) {
                                                        NavRouter.navKey!
                                                            .currentState!
                                                            .pushReplacementNamed(
                                                                RouteStrings
                                                                    .Dashboard);
                                                      } else {
                                                        BlocProvider.of<
                                                                    CompanySelectionBloc>(
                                                                context)
                                                            .add(SelectModuleEvent(
                                                                isRoleSkipped:
                                                                    false,
                                                                moduleValue: state
                                                                    .moduleType));
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
                                                              state.rolesList![
                                                                  index],
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
                                                                    Colors
                                                                        .white,
                                                                child: Text(
                                                                  StringFunctions
                                                                      .abbrievate(
                                                                          state.rolesList![
                                                                              index]),
                                                                  style: TextStyle(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor),
                                                                )),
                                                          ),
                                                        ),
                                                        (co ==
                                                                state.rolesList!
                                                                    .length)
                                                            ? Container()
                                                            : Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        28),
                                                                child: Divider(
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              )
                                                      ],
                                                    ),
                                                  );
                                                }))
                                            : (state is SelectModuleOnPageThree)
                                                ? ListView.builder(
                                                    itemCount: state
                                                        .modulesList!.length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    itemBuilder:
                                                        ((context, index) {
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
                                                          // NavRouter
                                                          //     .navKey!.currentState!
                                                          //     .popUntil((route) =>
                                                          //         route.isFirst);
                                                          // BlocProvider.of<
                                                          //             AuthenticationBloc>(
                                                          //         context)
                                                          //     .add(AppStarted());
                                                          NavRouter.navKey!
                                                              .currentState!
                                                              .pushReplacementNamed(
                                                                  RouteStrings
                                                                      .Dashboard);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            ListTile(
                                                              title: Container(
                                                                child: Text(
                                                                  state.modulesList![
                                                                      index],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22),
                                                                ),
                                                              ),
                                                              // subtitle: Text(roleNames),
                                                              leading:
                                                                  CircleAvatar(
                                                                radius: 21,
                                                                child:
                                                                    CircleAvatar(
                                                                        radius:
                                                                            20,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .white,
                                                                        child:
                                                                            Text(
                                                                          StringFunctions.abbrievate(
                                                                              state.modulesList![index]),
                                                                          style:
                                                                              TextStyle(color: Theme.of(context).primaryColor),
                                                                        )),
                                                              ),
                                                            ),
                                                            (co ==
                                                                    state
                                                                        .modulesList!
                                                                        .length)
                                                                ? Container()
                                                                : Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            28),
                                                                    child:
                                                                        Divider(
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  )
                                                          ],
                                                        ),
                                                      );
                                                    }))
                                                : Container()),
                              ]),
                            ),
                          ),
                        ),
                      ));
                },
              );
      },
    );
  }
}

class CRListWidget extends StatelessWidget {
  const CRListWidget(
      {Key? key,
      required this.rolesList,
      required this.roleNames,
      required this.companyName,
      required this.rhsCompany,
      required this.lhsCompany,
      this.onTapFunction})
      : super(key: key);

  final List<RoleModel> rolesList;
  final String? roleNames;
  final String companyName;
  final CompanyModel? rhsCompany;
  final CompanyModel? lhsCompany;
  final Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      // int moduleType = state.companyRoleModel!.companies![index].moduleType!;

      // if (rolesList.length == 1) {
      //   if (ModuleType.values[moduleType] == ModuleType.textile ||
      //       ModuleType.values[moduleType] == ModuleType.sizing) {
      //     NavRouter.navKey!.currentState!
      //         .pushReplacementNamed(RouteStrings.Dashboard);
      //   } else {
      //     BlocProvider.of<CompanySelectionBloc>(context)
      //         .add(SelectModuleEvent(moduleType));
      //   }
      // } else {
      //   BlocProvider.of<CompanySelectionBloc>(context).add(SelectRoleEvent(
      //       roleNames,
      //       state.cprlViewModel![index].companyName,
      //       state.companyRoleModel!.companies![index].moduleType));
      // }
      //},
      child: Column(
        children: [
          ListTile(
            title: Container(
              child: Text(
                companyName,
                //state.cprlViewModel![index].companyName
                style: TextStyle(fontSize: 22),
              ),
            ),
            subtitle: Text(roleNames!),
            leading: CircleAvatar(
              radius: 21,
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Text(
                    StringFunctions.abbrievate(companyName),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
            ),
          ),
          (lhsCompany == rhsCompany
              //  ==
              //
              )
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Divider(
                    color: Colors.grey,
                  ),
                )
        ],
      ),
    );
  }
}
