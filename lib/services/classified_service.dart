import 'package:classified_app/data/models/sub_category.dart';
import 'package:classified_app/ui/article_list/bloc/article_list_bloc.dart';
import 'package:classified_app/ui/article_profile/bloc/article_profile_bloc.dart';
import 'package:classified_app/ui/classifield_list/bloc/classified_list_bloc.dart';
import 'package:classified_app/ui/classifield_profile/bloc/classified_profile_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router.dart';

class ClassifiedService {
  // void addClassifiedBySubCategory(
  //     BuildContext context, SubCategoryModel subCategory) {
  //   BlocProvider.of<ClassifiedListBloc>(context)
  //       .add(GetClassifiedsBySubCategory(subCategory));
  //   NavRouter.navKey!.currentState!.pushNamed(RouteStrings.ClassifiedList);
  // }
  // void addArticleBySubCategory(
  //     BuildContext context, SubCategoryModel subCategory) {
  //   BlocProvider.of<ArticleListBloc>(context)
  //       .add(GetArticlesBySubCategory(subCategory));
  //   NavRouter.navKey!.currentState!.pushNamed(RouteStrings.ArticleList);
  // }

  void selectAndNavigateToClassified(BuildContext context, int classifiedId) {
    BlocProvider.of<ClassifiedProfileBloc>(context)
        .add(LoadClassified(classifiedId));
    NavRouter.navKey!.currentState!.pushNamed(
      RouteStrings.ClassifiedProfile,
    );
  }
  void selectAndNavigateToArticle(BuildContext context, int articleId) {
    BlocProvider.of<ArticleProfileBloc>(context)
        .add(LoadArticle(articleId));
    NavRouter.navKey!.currentState!.pushNamed(
      RouteStrings.ArticleProfile,
    );
  }
}
