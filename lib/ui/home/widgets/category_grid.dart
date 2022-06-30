// import 'package:classified_app/data/models/category.dart';
// import 'package:classified_app/ui/home/widgets/category_grid_item.dart';
// import 'package:flutter/material.dart';

// class CategoryGrid extends StatelessWidget {
//   final List<CategoryModel> categories;
//   const CategoryGrid({
//     required this.categories,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: BouncingScrollPhysics(),
//       crossAxisCount: 4,
//       children: categories
//           .map((e) => CategoryGridItem(
//                 categoryModel: e,
//               ))
//           .toList(),
//     );
//   }
// }
