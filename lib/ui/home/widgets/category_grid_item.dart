// import 'package:classified_app/const/icons.dart';
// import 'package:classified_app/const/padding.dart';
// import 'package:classified_app/data/models/category.dart';
// import 'package:classified_app/global/widgets/spaces.dart';
// import 'package:classified_app/services/sub_category_service.dart';
// import 'package:classified_app/utils/hex_color_extension.dart';
// import 'package:flutter/material.dart';

// import '../../../injection.dart';

// class CategoryGridItem extends StatelessWidget {
//   final CategoryModel? categoryModel;
//   const CategoryGridItem({
//     this.categoryModel,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkResponse(
//       onTap: () {
//         sl<SubCategoryService>()
//             .addSubCategoriesByCategory(context, categoryModel!);
//       },
//       child: GridTile(
//         child: Container(
//           height: 120,
//           width: 120,
//           padding: ConstPadding.all8,
//           child: Column(
//             children: [
//               SpaceHeightWithValue(height: 15),
//               IconMap.copyColor(
//                 IconMap.iconById(categoryModel!.iconId)!,
//                 color: (categoryModel!.color != null)
//                     ? ColorExtensions.fromHex(categoryModel!.color!)
//                     : Theme.of(context).primaryColor,
//               ),
//               SpaceHeightWithValue(height: 5),
//               Center(
//                   child: Text(
//                 categoryModel!.name!,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 11),
//               )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
