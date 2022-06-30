import 'dart:developer';

import 'package:classified_app/data/enums/module_type_enum.dart';
import 'package:classified_app/data/models/company_role_model.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/update_dialog.dart';
import 'package:classified_app/ui/company_selection/company_selection.dart';
import 'package:classified_app/ui/home/home.dart';
import 'package:classified_app/ui/loader.dart';
import 'package:classified_app/ui/login/login_page.dart';
import 'package:classified_app/ui/module_type/module_type.dart';
import 'package:classified_app/ui/role_selection/bloc/role_selection_bloc.dart';
import 'package:classified_app/ui/role_selection/role_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../company_selection/bloc/company_selection_bloc.dart';
import '../module_type/bloc/module_selection_bloc.dart';
import 'bloc/user_bloc.dart';

class ConditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return BlocBuilder<CompanySelectionBloc, CompanySelectionState>(
          builder: (context, state) {
        //\ return BlocBuilder<RoleSelectionBloc, RoleSelectionState>(builder: (context, state) {
        if (state is SelectCompanyOnPageOne) {
          if (state.companyRoleModel!.companies!.length == 1) {
            int moduleType = state.companyRoleModel!.companies![0].moduleType!;
            List<RoleModel>? rolesList =
                state.companyRoleModel!.companies![0].roles;

            if (rolesList!.length == 1) {
              if (ModuleType.values[moduleType] == ModuleType.textile ||
                  ModuleType.values[moduleType] == ModuleType.sizing) {
                return Dashboard();
              } else {
                int? moduleType =
                    state.companyRoleModel!.companies![0].moduleType;
                BlocProvider.of<CompanySelectionBloc>(context)
                    .add(SelectModuleEvent(isRoleSkipped: true, moduleValue: moduleType));
                return CompanySelection();
              }
            } else {
              BlocProvider.of<CompanySelectionBloc>(context).add(
                  SelectRoleEvent(
                      state.cprlViewModel![0].roleNames,
                      state.cprlViewModel![0].companyName,
                      state.companyRoleModel!.companies![0].moduleType));
              return CompanySelection();
            }
          } else {
            return CompanySelection();
          }
        } else if (state is SelectRoleOnPageTwo) {
          print(state);
          return CompanySelection();
        } else if (state is SelectModuleOnPageThree) {
          return CompanySelection();
        } else {
          return Loader();
        }
        // } else if (state is Unauthenticated) {
        //   return LoginPage();
        // } else if (state is ForceUpdateState) {
        //   return UpdateScreen();
        // } else {
        //   return CompanySelection();
        // }
      });
    });
  }
}
