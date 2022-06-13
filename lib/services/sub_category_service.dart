import 'package:classified_app/data/models/category.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/sub_categories_list/bloc/sub_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryService {
  void addSubCategoriesByCategory(
      BuildContext context, CategoryModel? category) {
    BlocProvider.of<SubCategoryBloc>(context)
        .add(LoadSubCategories(category: category!));

    NavRouter.navKey!.currentState!.pushNamed(RouteStrings.SubCategoryList);
  }
}
