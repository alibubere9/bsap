import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:classified_app/ui/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/ui/drawer/app_drawer.dart';

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
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: ConstPadding.all12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SpaceHeightWithValue(height: 100),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.redAccent.shade100),
                          width: 400,
                          height: 250,
                          child: const Center(
                              child: Text(
                            "...Dashboard...",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w400),
                          )),
                        ),
                      ],
                    ),
                  ),
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
