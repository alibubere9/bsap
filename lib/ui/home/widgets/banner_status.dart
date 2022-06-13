import 'package:classified_app/data/models/banner.dart';
import 'package:classified_app/ui/banner-ad/bloc/banner_bloc.dart';
import 'package:classified_app/utils/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BannerStatus extends StatelessWidget {
  const BannerStatus({
    Key? key,
    required this.bannerAd,
  }) : super(key: key);

  final BannerAd? bannerAd;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.thumbsUp,
              color: bannerAd?.isLiked ?? false
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            onPressed: () {
              BlocProvider.of<BannerBloc>(context).add(
                bannerAd!.isLiked!
                    ? UnlikeBannerAd(bannerAd)
                    : LikeBannerAd(bannerAd),
              );
            },
          ),
          Text(bannerAd?.likeCount?.toString() ?? '0'),
          IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(FontAwesomeIcons.share),
            onPressed: () {
              shareBanner(bannerAd!);
            },
          ),
        ],
      ),
    );
  }
}
