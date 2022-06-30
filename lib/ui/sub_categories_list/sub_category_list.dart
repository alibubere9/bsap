import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:classified_app/global/widgets/breadcrumb.dart';
import 'package:classified_app/global/widgets/category_shimmer.dart';
import 'package:classified_app/global/widgets/dashboard_logo.dart';
import 'package:classified_app/global/widgets/notification_button.dart';
import 'package:classified_app/global/widgets/profile_button.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/injection.dart';
import 'package:classified_app/nullsafe-dependencies/alphabet-scroll-view.dart';
import 'package:classified_app/services/classified_service.dart';
import 'package:classified_app/ui/sub_categories_list/bloc/sub_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryListScreen extends StatelessWidget {
  const SubCategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: ConstPadding.all12,
        child: BlocBuilder<SubCategoryBloc, SubCategoryState>(
          builder: (context, state) {
            if (state is SubCategoryLoaded) {
              return Column(
                children: [
                  Breadcrumb(
                    categoryModel: state.category,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (state.subCategories.isEmpty)
                            ? Center(
                                child: Container(
                                    child: Text(
                                  '${ConstantStrings.noSubCategories}${state.category.name}',
                                  style: TextStyles.style16w800,
                                )),
                              )
                            : Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: AlphabetListScrollView(
                                  showPreview: true,
                                  indexedHeight: (i) {
                                    return 50.0;
                                  },
                                  highlightTextStyle: TextStyles.style14
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                  normalTextStyle: TextStyles.style14,
                                  strList: state.subCategories
                                      .map((e) => e.name)
                                      .toList(),
                                  itemBuilder: (context, index) {
                                    final e = state.subCategories[index];
                                    return Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: ListTile(
                                        onTap: () {
                                          bool isBhiwandiSpecial = state
                                                  .category.isSpecialCategory ??
                                              false;
                                          if (isBhiwandiSpecial) {
                                            // sl<ClassifiedService>()
                                            //     .addArticleBySubCategory(
                                            //         context, e);
                                          } else {
                                            // sl<ClassifiedService>()
                                            //     .addClassifiedBySubCategory(
                                            //         context, e);
                                          }
                                        },
                                        title: Text(e.name!),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ],
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
