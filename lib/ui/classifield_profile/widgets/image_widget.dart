import 'package:classified_app/const/image_paths.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/global/widgets/image_loading.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? url;
  const ImageWidget({
    this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.92;
    return Container(
      margin: ConstPadding.onlyR10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          UrlConcat.concatUrl(url ?? ImagePaths.noImageUrl),
          loadingBuilder: (context, child, loadingProgress) {
            return loadingProgress == null
                ? child
                : ImageLoading(
                    height: 300,
                    width: width,
                  );
          },
          fit: BoxFit.cover,
          width: width,
        ),
      ),
    );
  }
}
