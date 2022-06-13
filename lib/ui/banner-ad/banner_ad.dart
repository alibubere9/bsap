import 'package:classified_app/const/padding.dart';
import 'package:classified_app/data/models/banner.dart';
import 'package:classified_app/global/widgets/loading_indicator.dart';
import 'package:classified_app/global/widgets/slider.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/ui/banner-ad/bloc/banner_bloc.dart';
import 'package:classified_app/ui/home/widgets/banner_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerAdDetailsPage extends StatelessWidget {
  final BannerAd? bannerAd;

  const BannerAdDetailsPage({Key? key, this.bannerAd}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bannerAd!.title!,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ConstPadding.all12,
          child: Column(
            children: [
              SpaceHeightWithValue(height: 10),
              ImageSlider(images: bannerAd!.images),
              SpaceHeightWithValue(height: 25),
              Text(bannerAd!.longDescription!),
              SpaceHeightWithValue(height: 10),
              BlocBuilder<BannerBloc, BannerState>(
                builder: (context, state) {
                  if (state is BannerLoaded)
                    return BannerStatus(
                        bannerAd: state.banners.firstWhere(
                            (element) => element.id == bannerAd!.id));
                  return Center(
                    child: LoadingIndicator(),
                  );
                },
              ),
              SpaceHeightWithValue(height: 10),
              Divider(color: Colors.grey, height: 2)
            ],
          ),
        ),
      ),
    );
  }
}
