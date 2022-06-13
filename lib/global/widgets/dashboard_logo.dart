import 'package:classified_app/const/image_paths.dart';
import 'package:classified_app/environment/environment.dart';
import 'package:classified_app/ui/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';

class DashboardLogo extends StatelessWidget {
  final double width;
  const DashboardLogo({
    Key? key,
    this.width = 90,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavRouter.navKey!.currentState!.popUntil((route) => route.isFirst);
      },
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              ImagePaths.dashboardLogo,
              // fit: BoxFit.cover,
              width: width,
            ),
          ),
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state is SettingsLoaded) {
                if (state.environment == Environment.dev) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        margin: EdgeInsets.only(left: 95),
                        padding: EdgeInsets.all(3),
                        color: Colors.red,
                        width: 20,
                        height: 14,
                        child: Text(
                          "DEV",
                          style: TextStyle(fontSize: 8),
                        )),
                  );
                } else {
                  return Container();
                }
              } else
                return Container();
            },
          )
        ],
      ),
    );
  }
}
