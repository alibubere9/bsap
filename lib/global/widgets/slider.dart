import 'package:classified_app/router.dart';
import 'package:classified_app/ui/classifield_profile/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String>? images;
  const ImageSlider({
    Key? key,
    this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        cacheExtent: 200,
        physics: PageScrollPhysics(),
        children: images
                ?.map((e) => GestureDetector(
                    onTap: () {
                      _enlarge(context, e);
                    },
                    child: ImageWidget(url: e)))
                .toList() ??
            [],
      ),
    );
  }

  void _enlarge(BuildContext context, String e) {
    NavRouter.navKey!.currentState!.pushNamed(RouteStrings.EnlargedImage,
        arguments: EnlargedImageArgs(
            imageUrls: images, selectedIndex: images!.indexOf(e)));
  }
}
