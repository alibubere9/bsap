import 'package:classified_app/const/image_paths.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/data/models/article.dart';
import 'package:classified_app/global/widgets/image_loading.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/services/classified_service.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:flutter/material.dart';

import '../../../injection.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        sl<ClassifiedService>()
            .selectAndNavigateToArticle(context, article.id!);
      },
      child: Container(
        margin: ConstPadding.onlyB10,
        padding: ConstPadding.all12,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: width * 0.2,
                    child: Image.network(
                      UrlConcat.concatUrl(
                          article.images?.first ?? ImagePaths.noImageUrl),
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : ImageLoading(
                                height: 50,
                                width: width * 0.2,
                              );
                      },
                    )),
                SpaceWidthWithValue(width: 15),
                Container(
                  width: width * 0.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.heading ?? 'Heading missing',
                        style: TextStyle(fontSize: 19),
                      ),
                      Container(
                        width: width * 0.6,
                        child: Text(
                          article.description ?? 'Description missing',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
