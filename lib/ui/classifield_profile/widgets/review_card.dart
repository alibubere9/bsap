import 'package:classified_app/data/models/review.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/utils/name_abbrievation.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel? reviewModel;
  const ReviewCard({Key? key, this.reviewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile(
            leading: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor)),
              child: Center(
                  child: Text(
                StringFunctions.abbrievate(reviewModel?.name ?? "ABCD"),
                style: TextStyle(
                    fontSize: 35, color: Theme.of(context).primaryColor),
              )),
            ),
            trailing: Container(
              width: 50,
              child: Text(
                reviewModel?.rating?.toString() ?? 0.0.toString(),
                style: TextStyles.style21bold
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            title: Text(reviewModel?.name ?? ''),
            subtitle: Text(
              reviewModel?.review ?? '',
            ),
          ),
        ),
        Space(),
      ],
    );
  }
}
