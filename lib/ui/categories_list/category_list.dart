import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:classified_app/global/widgets/breadcrumb.dart';
import 'package:classified_app/global/widgets/category_shimmer.dart';
import 'package:classified_app/global/widgets/dashboard_logo.dart';
import 'package:classified_app/global/widgets/notification_button.dart';
import 'package:classified_app/global/widgets/profile_button.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/nullsafe-dependencies/alphabet-scroll-view.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/categories_list/bloc/category_list_bloc.dart';
import 'package:classified_app/ui/sub_categories_list/bloc/sub_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: ConstPadding.all12,
        child: BlocBuilder<CategoryListBloc, CategoryListState>(
          builder: (context, state) {
            if (state is CategoryListLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Breadcrumb(),
                  Align(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (state.categories.isEmpty)
                              ? Center(
                                  child: Container(
                                      child: Text(
                                    ConstantStrings.noCategories,
                                    style: TextStyles.style16w800,
                                  )),
                                )
                              : (state.categories[0].isSpecialCategory ?? false)
                                  ? SpecialCategories(state)
                                  : NormalCategories(state),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: CategoryShimmer(),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(title: DashboardLogo(), actions: [
      NotificationButton(),
      ProfileButton(),
      SpaceWidthWithValue(
        width: 15,
      )
    ]);
  }
}

class SpecialCategories extends StatelessWidget {
  final CategoryListLoaded state;
  const SpecialCategories(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: state.categories
              .map(
                (e) => Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          BlocProvider.of<SubCategoryBloc>(context)
                              .add(LoadSubCategories(category: e));
                          NavRouter.navKey!.currentState!
                              .pushNamed(RouteStrings.SubCategoryList);
                        },
                        child: Container(
                            height: 75,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 15,
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.1),
                                    offset: Offset.fromDirection(0.4, 20)),
                                BoxShadow(
                                    blurRadius: 20,
                                    spreadRadius: 0.2,
                                    color: Theme.of(context)
                                        .primaryColorDark
                                        .withOpacity(0.4),
                                    offset: Offset.fromDirection(-0.4, -10))
                              ],
                              gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).primaryColor,
                                    Theme.of(context).accentColor,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              e.name!,
                              style: TextStyles.style27bold.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            )),
                      ),
                    )),
              )
              .toList()),
    );
  }
}

class NormalCategories extends StatelessWidget {
  final CategoryListLoaded state;
  const NormalCategories(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: AlphabetListScrollView(
        showPreview: true,
        indexedHeight: (i) {
          return 50.0;
        },
        highlightTextStyle:
            TextStyles.style14.copyWith(color: Theme.of(context).primaryColor),
        normalTextStyle: TextStyles.style14,
        strList: state.categories.map((e) => e.name).toList(),
        itemBuilder: (context, index) {
          final e = state.categories[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListTile(
              onTap: () {
                BlocProvider.of<SubCategoryBloc>(context)
                    .add(LoadSubCategories(category: e));
                NavRouter.navKey!.currentState!
                    .pushNamed(RouteStrings.SubCategoryList);
              },
              title: Text(e.name!),
            ),
          );
        },
      ),
    );
  }
}
