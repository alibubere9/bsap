import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/profile_image.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/categories_list/bloc/category_list_bloc.dart';
import 'package:classified_app/ui/faqs/bloc/faqs_bloc.dart';
import 'package:classified_app/ui/user/bloc/user_bloc.dart';
import 'package:classified_app/utils/launch_native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'const/strings.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return Container(
          width: double.infinity,
          child: Drawer(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: ConstPadding.l15t50r15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return (state is RegisteredUserState)
                            ? ListTile(
                                title: Text(
                                  state.user.username!,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(
                                    AppDrawerStrings.manageSettingsAndProfile,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                                trailing: ProfileImage(
                                  radius: 32,
                                  fontSize: 20,
                                ),
                                onTap: () {
                                  UserState userState =
                                      BlocProvider.of<UserBloc>(context).state;
                                  if (userState is RegisteredUserState) {
                                    NavRouter.navKey!.currentState!
                                        .popAndPushNamed(RouteStrings.Profile);
                                  }
                                },
                              )
                            : Container();
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DrawerItems(
                      icon: FontAwesomeIcons.userEdit,
                      text: AppDrawerStrings.editProfile,
                      onTap: () {
                        UserState userState =
                            BlocProvider.of<UserBloc>(context).state;
                        if (userState is RegisteredUserState) {
                          NavRouter.navKey!.currentState!
                              .popAndPushNamed(RouteStrings.SignUp);
                        }
                      },
                    ),
                    DrawerItems(
                      icon: FontAwesomeIcons.listUl,
                      text: ConstantStrings.category,
                      onTap: () {
                        context.read<CategoryListBloc>().add(LoadCategories());
                        NavRouter.navKey!.currentState!
                            .popAndPushNamed(RouteStrings.CategoryList);
                      },
                    ),
                    DrawerItems(
                      icon: FontAwesomeIcons.cog,
                      text: ConstantStrings.settings,
                      onTap: () {
                        NavRouter.navKey!.currentState!
                            .popAndPushNamed(RouteStrings.Settings);
                      },
                    ),
                    DrawerItems(
                      icon: FontAwesomeIcons.userShield,
                      text: ConstantStrings.privacyPolicy,
                      onTap: () {
                        NavRouter.navKey!.currentState!
                            .popAndPushNamed(RouteStrings.Privacy);
                      },
                    ),
                    DrawerItems(
                      icon: FontAwesomeIcons.commentAlt,
                      onTap: () {
                        NavRouter.navKey!.currentState!
                            .popAndPushNamed(RouteStrings.Feedback);
                      },
                      text: ConstantStrings.sendFeedback,
                    ),
                    DrawerItems(
                      icon: Icons.star_border,
                      text: AppDrawerStrings.rateUs,
                      onTap: launchPlatforApp,
                    ),
                    DrawerItems(
                      icon: FontAwesomeIcons.exclamationCircle,
                      text: ConstantStrings.aboutUs,
                      onTap: () {
                        NavRouter.navKey!.currentState!
                            .popAndPushNamed(RouteStrings.About);
                      },
                    ),
                    DrawerItems(
                      icon: FontAwesomeIcons.comments,
                      text: 'FAQ\'s',
                      onTap: () {
                        BlocProvider.of<FaqsBloc>(context).add(LoadFaqs());
                        NavRouter.navKey!.currentState!
                            .popAndPushNamed(RouteStrings.Faqs);
                      },
                    ),
                    DrawerItems(
                      icon: Icons.logout,
                      text: AppDrawerStrings.logout,
                      onTap: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LoggedOutEvent());
                        print(state);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}

class DrawerItems extends StatelessWidget {
  final IconData? icon;
  final Function? onTap;
  final String? text;
  const DrawerItems({this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        size: 17,
      ),
      title: Text(
        text!,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      onTap: onTap as void Function()?,
      contentPadding: ConstPadding.onlyl8,
    );
  }
}
