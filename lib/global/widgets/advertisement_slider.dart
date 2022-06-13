import 'dart:async';

import 'package:classified_app/const/padding.dart';
import 'package:classified_app/data/models/carousel.dart';
import 'package:classified_app/services/classified_service.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:flutter/material.dart';

import '../../injection.dart';
import 'image_loading.dart';

class AdvertisemntSlider extends StatefulWidget {
  final List<Carousel> carousels;
  const AdvertisemntSlider({
    Key? key,
    required this.carousels,
  }) : super(key: key);
  @override
  _AdvertisemntSliderState createState() => _AdvertisemntSliderState();
}

class _AdvertisemntSliderState extends State<AdvertisemntSlider> {
  List<Carousel> carousels = [];
  int selectedIndex = 0;
  Timer? timer;
  @override
  void initState() {
    carousels = widget.carousels;
    print(carousels);
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      _next();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  void _next() {
    setState(() {
      if (selectedIndex < carousels.length - 1) {
        selectedIndex++;
      } else if (selectedIndex == carousels.length - 1) {
        selectedIndex = 0;
      }
    });
  }

  void _previous() {
    setState(() {
      if (selectedIndex > 0) {
        selectedIndex--;
      } else if (selectedIndex == 0) {
        selectedIndex = carousels.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return (carousels.isEmpty)
        ? Container()
        : GestureDetector(
            onTap: () {
              sl<ClassifiedService>().selectAndNavigateToClassified(
                  context, carousels[selectedIndex].classifiedId!);
            },
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                _previous();
              } else if (details.primaryVelocity! < 0) {
                _next();
              }
            },
            child: Stack(
              children: [
                // Must be the current Ad which navigates to the details page.
                Container(
                  width: double.infinity,
                  height: 150,
                  child: Image.network(
                    UrlConcat.concatUrl(
                      carousels[selectedIndex].imageUrl!,
                    ),
                    loadingBuilder: (context, child, loadingProgress) {
                      return loadingProgress == null
                          ? child
                          : ImageLoading(
                              height: 125,
                              width: double.infinity,
                            );
                    },
                    fit: BoxFit.fitWidth,
                  ),
                ),
                //This is the greadient of the container.
                Container(
                  width: double.infinity,
                  height: 125,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                //These are the dots and the current index has a bigger size.
                Padding(
                  padding: ConstPadding.onlyB10,
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          carousels.length,
                          (index) => Container(
                                margin: ConstPadding.onlyR10,
                                height: index == selectedIndex ? 9 : 5,
                                width: index == selectedIndex ? 9 : 5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              )),
                    ),
                  ),
                )
              ],
              alignment: Alignment.bottomCenter,
            ),
          );
  }
}
