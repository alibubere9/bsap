import 'package:classified_app/const/image_paths.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/data/models/classified.dart';
import 'package:classified_app/global/widgets/button.dart';
import 'package:classified_app/global/widgets/image_loading.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/nullsafe-dependencies/smooth-star-rating.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/services/classified_service.dart';
import 'package:classified_app/ui/get_best_deal/bloc/bestdeal_bloc.dart';
import 'package:classified_app/utils/distance.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:classified_app/utils/launch_native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';

class ClassifiedTile extends StatelessWidget {
  const ClassifiedTile({
    Key? key,
    required this.classified,
  }) : super(key: key);

  final ClassifiedModel classified;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        sl<ClassifiedService>()
            .selectAndNavigateToClassified(context, classified.id!);
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
                        classified.imageTile ??
                            classified.images?.first ??
                            ImagePaths.noImageUrl,
                      ),
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
                  width: width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        classified.name ?? 'No name',
                        style: TextStyle(fontSize: 19),
                      ),
                      SpaceHeightWithValue(height: 3),
                      Row(
                        children: [
                          Text(classified.location ?? 'No Location',
                              style: TextStyle(fontSize: 16)),
                          SpaceWidthWithValue(width: 10),
                          Text(
                              Distance.convertToDistanceString(
                                  classified.distance ?? 0.0),
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(classified.rating!.toStringAsFixed(1),
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold)),
                          SpaceWidthWithValue(width: 3),
                          SmoothStarRating(
                            isReadOnly: true,
                            rating: classified.rating!,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SpaceHeightWithValue(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width * 0.4,
                  child: Button(
                    onTap: () {
                      BlocProvider.of<BestDealBloc>(context)
                          .add(NavigatingToBestDeal(classified.id));
                      NavRouter.navKey!.currentState!.pushNamed(
                          RouteStrings.GetBestDeal,
                          arguments: BestDealObj(
                              classifiedId: classified.id!,
                              classifiedName: classified.name!));
                    },
                    text: ConstantStrings.getBestDeal,
                    fontSize: 16,
                    textColor: Theme.of(context).primaryColor,
                    bgColor: Colors.transparent,
                    borderColor: Theme.of(context).primaryColor,
                  ),
                ),
                Container(
                  width: width * 0.4,
                  child: Button(
                    text: ConstantStrings.callNow,
                    fontSize: 16,
                    bgColor: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    borderColor: Theme.of(context).primaryColor,
                    onTap: () {
                      launchCaller(phone: classified.contactNo);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
