import 'package:classified_app/global/widgets/dashboard_logo.dart';
import 'package:classified_app/global/widgets/image_loading.dart';
import 'package:classified_app/global/widgets/notification_button.dart';
import 'package:classified_app/global/widgets/profile_button.dart';
import 'package:classified_app/global/widgets/profile_shimmer.dart';
import 'package:classified_app/global/widgets/slider.dart';
import 'package:classified_app/nullsafe-dependencies/smooth-star-rating.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/classifield_profile/widgets/icon_text.dart';
import 'package:classified_app/ui/classifield_profile/widgets/review_card.dart';
import 'package:classified_app/ui/classifield_profile/widgets/round_button.dart';
import 'package:classified_app/ui/get_best_deal/bloc/bestdeal_bloc.dart';
import 'package:classified_app/utils/app_messages.dart';
import 'package:classified_app/utils/gmap.dart';
import 'package:classified_app/utils/name_abbrievation.dart';
import 'package:classified_app/utils/share.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:classified_app/utils/launch_native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/data/models/classified.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:classified_app/global/widgets/button.dart';
import 'package:classified_app/global/widgets/search_field.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/ui/classifield_profile/bloc/classified_profile_bloc.dart';

class ClassifiedProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<ClassifiedProfileBloc, ClassifiedProfileState>(
        builder: (context, state) {
          if (state is ClassifiedProfileLoaded) {
            return buildClassifiedLoaded(state.classified, context,
                currentUserRated: state.currentUserRated);
          }
          return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ProfileShimmer());
        },
      ),
    );
  }

  getToReviewPage(BuildContext context, double? rating,
      {int? classifiedId, String? classifiedName}) {
    NavRouter.navKey!.currentState!.pushNamed(RouteStrings.WriteAReview,
        arguments: ReviewObj(
            rating: rating!,
            classifiedId: classifiedId!,
            classifiedName: classifiedName!));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: DashboardLogo(),
      actions: [
        NotificationButton(),
        ProfileButton(),
        SpaceWidthWithValue(width: 15)
      ],
    );
  }

  SingleChildScrollView buildClassifiedLoaded(
      ClassifiedModel classified, BuildContext context,
      {currentUserRated = false}) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.99,
        padding: ConstPadding.all12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              text: classified.name!,
            ),
            SpaceHeightWithValue(height: 35),
            buildImageListView((classified.imageTile == null)
                ? classified.images
                : [classified.imageTile!, ...classified.images!]),
            SpaceHeightWithValue(height: 10),
            Text(
              classified.name!,
              style: TextStyles.style21bold,
            ),
            Text(
              classified.location ?? 'No Location',
              style: TextStyles.style14,
            ),
            Text(
              classified.description ?? 'No Description',
              style: TextStyles.style14,
            ),
            buildRating(classified.rating, context),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ConstantStrings.specialistIn),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      StringFunctions.toPascalCaseForPattern(
                          classified.specialistIn ??
                              'Not specialist in anything',
                          ","),
                      style: TextStyles.style14.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SpaceHeightWithValue(
              height: 15,
            ),
            SpaceHeightWithValue(height: 10),
            buildButtons(classified, context),
            SpaceHeightWithValue(height: 20),
            Button(
              text: ConstantStrings.getBestDeal,
              onTap: () {
                BlocProvider.of<BestDealBloc>(context)
                    .add(NavigatingToBestDeal(classified.id));
                NavRouter.navKey!.currentState!.pushNamed(
                    RouteStrings.GetBestDeal,
                    arguments: BestDealObj(
                        classifiedId: classified.id!,
                        classifiedName: classified.name!));
              },
              bgColor: Colors.transparent,
              textColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
            ),
            Space(),
            buildPhotos(classified.images ?? [], context),
            Divider(
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            SpaceHeightWithValue(height: 20),
            buildRateThis(context,
                classifiedId: classified.id,
                classifiedName: classified.name,
                currentUserRated: currentUserRated),
            Space(),
            IconAndText(
              onTap: () {
                openMap(classified.latitude, classified.longitude);
              },
              icon: Icons.map,
              text: classified.address,
            ),
            IconAndText(
              onTap: () {
                launchCaller(phone: classified.contactNo);
              },
              icon: Icons.phone_outlined,
              text: classified.contactNo,
            ),
            IconAndText(
              icon: FontAwesomeIcons.clock,
              text: classified.availability,
            ),
            Space(),
            Text(
              ConstantStrings.ratingAndReviews,
              style: TextStyles.style21bold,
            ),
            buildRatingContainer(context, classified),
            SpaceHeightWithValue(height: 15),
            if ((classified.reviews?.length ?? 0) > 0) buildReviews(classified),
            Space(),
            Text(
              ConstantStrings.alsoListedIn,
              style: TextStyles.style16w800,
            ),
            if ((classified.categories?.length ?? 0) > 0)
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: classified.categories
                          ?.map((e) => Text(e ?? ''))
                          .toList() ??
                      [],
                ),
              ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView buildReviews(ClassifiedModel classified) {
    return SingleChildScrollView(
      child: Column(
        children: classified.reviews!
            .map(
              (e) => ReviewCard(
                reviewModel: e,
              ),
            )
            .toList(),
      ),
    );
  }

  Column buildRateThis(BuildContext context,
      {int? classifiedId,
      String? classifiedName,
      bool currentUserRated = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate this',
          style: TextStyles.style21bold,
        ),
        SpaceHeightWithValue(height: 10),
        (currentUserRated)
            ? Text("You've already rated this business.")
            : Center(
                child: SmoothStarRating(
                  spacing: 15,
                  allowHalfRating: true,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  onRated: (v) {
                    getToReviewPage(context, v,
                        classifiedId: classifiedId,
                        classifiedName: classifiedName);
                  },
                ),
              ),
      ],
    );
  }

  Widget buildRatingContainer(
      BuildContext context, ClassifiedModel classified) {
    double width = MediaQuery.of(context).size.width * 0.7;
    return Row(
      children: [
        Container(
          margin: ConstPadding.all10,
          decoration: BoxDecoration(
              // color: Theme.of(context).primaryColor,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withRed(200)
                ],
              ),
              borderRadius: BorderRadius.circular(11)),
          height: 75,
          width: 75,
          child: Center(
              child: Text(
            classified.rating!.toStringAsFixed(1),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 35,
            ),
          )),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ConstantStrings.totalRatings(classified.totalRatings),
                style: TextStyles.style16w800.copyWith(color: Colors.white),
              ),
              Container(
                width: width * 0.8,
                child: Text(
                  ConstantStrings.totalRatingsSubtitle(classified.totalRatings),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildPhotos(List<String> images, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ConstantStrings.photos,
          style: TextStyles.style21bold,
        ),
        GridView.count(
          cacheExtent: 10,
          physics: PageScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          children: images
              .map((e) => Padding(
                    padding: ConstPadding.all8,
                    child: GestureDetector(
                      onTap: () {
                        NavRouter.navKey!.currentState!.pushNamed(
                            RouteStrings.EnlargedImage,
                            arguments: EnlargedImageArgs(
                                imageUrls: images,
                                selectedIndex: images.indexOf(e)));
                      },
                      child: Image.network(
                        UrlConcat.concatUrl(e),
                        loadingBuilder: (context, child, loadingProgress) {
                          return (loadingProgress == null)
                              ? child
                              : ImageLoading(width: 150, height: 150);
                        },
                      ),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }

  Container buildButtons(ClassifiedModel classified, BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundButton(
          icon: Icons.phone,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            launchCaller(phone: classified.contactNo);
          },
        ),
        RoundButton(
          icon: FontAwesomeIcons.directions,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            openMap(classified.latitude, classified.longitude);
          },
        ),
        RoundButton(
          icon: FontAwesomeIcons.whatsapp,
          onPressed: (classified.whatsAppNumber != null &&
                  classified.whatsAppNumber!.length == 10)
              ? () {
                  launchWhatsApp(
                      phone: classified.whatsAppNumber,
                      message: AppMessagesManager.getMessage(
                              AppMessageKeys.whatsAppDefault)
                          .replaceAll(
                              ConstantStrings.classifiedNameTemplateString,
                              classified.name!)
                          .replaceAll(
                              ConstantStrings.classifiedAddressTemplateString,
                              classified.contactNo!)
                          .replaceAll(
                              ConstantStrings.classifiedContactTemplateString,
                              classified.address!)
                          .toString());
                }
              : () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(AppMessagesManager.getMessage(
                          AppMessageKeys.whatsAppNumberNotFound))));
                },
          color: (classified.whatsAppNumber != null &&
                  classified.whatsAppNumber!.length == 10)
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(0.45),
        ),
        RoundButton(
          icon: Icons.share_outlined,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            shareClassified(classified);
          },
        ),
      ],
    ));
  }

  Row buildRating(double? rating, BuildContext context) {
    return Row(
      children: [
        Text(
          rating!.toStringAsFixed(1),
          style: TextStyles.style16w800,
        ),
        SpaceWidthWithValue(width: 7),
        SmoothStarRating(
          rating: rating,
          //onRated: getToReviewPage(context),
          size: 14,
          color: Colors.amber,
          isReadOnly: true,
          allowHalfRating: true,
          defaultIconData: Icons.star_border_outlined,
        ),
      ],
    );
  }

  Widget buildImageListView(List<String>? images) {
    return ImageSlider(images: images);
  }
}
