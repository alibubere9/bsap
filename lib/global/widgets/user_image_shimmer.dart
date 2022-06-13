import 'package:classified_app/global/widgets/base_shimmer.dart';
import 'package:flutter/material.dart';

class ProfileRectImageShimmer extends StatelessWidget {
  const ProfileRectImageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseShimmmer(
      count: 1,
      child: Container(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12)),
            height: 150,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
            ),
          )),
    );
  }
}

class ProfileCircleImageShimmer extends StatelessWidget {
  const ProfileCircleImageShimmer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseShimmmer(
      count: 1,
      child: Container(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(color: Colors.white, width: 2.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                radius: 65,
              ),
            ),
          ),
      ),
    );
  }
}
