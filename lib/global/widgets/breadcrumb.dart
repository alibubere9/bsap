import 'package:classified_app/const/strings.dart';
import 'package:classified_app/data/models/category.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Breadcrumb extends StatelessWidget {
  final CategoryModel? categoryModel;
  const Breadcrumb({Key? key, this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          (categoryModel == null)
              ? ConstantStrings.selectCategory
              : categoryModel!.name!,
          style: TextStyles.style16w800
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        Icon(FontAwesomeIcons.chevronRight,
            size: 13, color: Theme.of(context).primaryColor),
        Text(
          ConstantStrings.selectSubCategory,
          style: (categoryModel == null)
              ? TextStyles.style16w800
              : TextStyles.style16w800
                  .copyWith(color: Theme.of(context).primaryColor),
        ),
      ]),
    );
  }
}
