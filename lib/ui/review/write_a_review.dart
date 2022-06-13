import 'package:classified_app/data/models/review.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/classifield_profile/bloc/classified_profile_bloc.dart';
import 'package:flutter/material.dart';

import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/nullsafe-dependencies/smooth-star-rating.dart';
import 'package:classified_app/utils/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/review_bloc.dart';

// ignore: must_be_immutable
class ReviewScreen extends StatelessWidget {
  final double? rating;
  final int? classifiedId;
  final String? classifiedName;
  TextEditingController reviewController = TextEditingController();

  ReviewScreen({
    Key? key,
    this.rating,
    this.classifiedId,
    this.classifiedName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewBloc, ReviewState>(
      listener: (context, state) {
        if (state is ReviewLoaded) {
          NavRouter.navKey!.currentState!.pop();
          context
              .read<ClassifiedProfileBloc>()
              .add(LoadClassified(classifiedId!));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              ConstantStrings.writeAReview,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 22),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 58,
                padding: ConstPadding.l25r25b10,
                child: submitButton(() {
                  if (reviewController.text.isEmpty ||
                      reviewController.text.length < 5) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Review must be of at least 5 characters.')));
                  } else {
                    BlocProvider.of<ReviewBloc>(context).add(SendReviewEvent(
                        ReviewModel(
                            classifiedId: classifiedId,
                            rating: rating,
                            review: reviewController.text)));
                  }
                }, context, 'Submit')),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: ConstPadding.all20,
                  child: Text(
                    classifiedName!,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.7),
                ),
                Container(
                  padding: ConstPadding.symmH22V8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overall ($rating)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SpaceWidthWithValue(width: 18),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Theme.of(context).primaryColor)),
                        child: SmoothStarRating(
                          rating: rating,
                          //borderColor: Theme.of(context).primaryColor,
                          //onRated: getToReviewPage(context),
                          size: 28,
                          color: Colors.amber,
                          isReadOnly: true,
                          allowHalfRating: true,
                          defaultIconData: Icons.star_border_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: ConstPadding.all25,
                  child: TextField(
                    style: TextStyle(fontSize: 15),
                    // keyboardType: keyboardType,
                    controller: reviewController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'Write Review',
                      isDense: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.6)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.6)),
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey.withOpacity(0.8))
              ],
            ),
          ),
        );
      },
    );
  }
}
