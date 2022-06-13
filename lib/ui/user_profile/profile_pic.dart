import 'package:classified_app/const/image_paths.dart';
import 'package:classified_app/global/widgets/image_loading.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final String? imageUrl;

  const ProfilePic({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Image.network(UrlConcat.concatUrl(
          imageUrl ?? ImagePaths.noImageUrl),
          loadingBuilder: (context, child, loadingProgress) => 
                           (loadingProgress == null) ? child : ImageLoading(width: 150, height: 150),
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
