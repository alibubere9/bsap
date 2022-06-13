import 'package:classified_app/const/image_paths.dart';
import 'package:classified_app/data/models/category.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/advertisement_slider.dart';
import 'package:classified_app/global/widgets/banner_shimmer.dart';
import 'package:classified_app/global/widgets/carousel_shimmer.dart';
import 'package:classified_app/global/widgets/dashboard_logo.dart';
import 'package:classified_app/global/widgets/grid_shimmer.dart';
import 'package:classified_app/global/widgets/image_loading.dart';
import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:classified_app/global/widgets/notification_button.dart';
import 'package:classified_app/global/widgets/profile_button.dart';
import 'package:classified_app/ui/banner-ad/bloc/banner_bloc.dart';
import 'package:classified_app/ui/carousel/bloc/carousel_bloc.dart';
import 'package:classified_app/ui/categories_list/bloc/category_list_bloc.dart';
import 'package:classified_app/ui/home/widgets/banner_status.dart';
import 'package:classified_app/utils/buttons.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/data/models/banner.dart';
import 'package:classified_app/global/widgets/button.dart';
import 'package:classified_app/global/widgets/search_field.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/ui/drawer/app_drawer.dart';
import 'package:classified_app/ui/home/widgets/category_grid.dart';
import 'package:classified_app/router.dart';

import 'bloc/home_bloc.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        drawer: AppDrawer(),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: ConstPadding.all12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SpaceHeightWithValue(height: 100),
                  Center(
                    child: Text(
                      "Its Dashboard...",
                      style: TextStyle(fontSize: 60),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
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
