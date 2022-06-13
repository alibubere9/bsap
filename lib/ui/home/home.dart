import 'package:classified_app/const/image_paths.dart';
import 'package:classified_app/data/models/category.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/advertisement_slider.dart';
import 'package:classified_app/global/widgets/banner_shimmer.dart';
import 'package:classified_app/global/widgets/carousel_shimmer.dart';
import 'package:classified_app/global/widgets/dashboard_logo.dart';
import 'package:classified_app/global/widgets/grid_shimmer.dart';
import 'package:classified_app/global/widgets/image_loading.dart';
import 'package:classified_app/global/widgets/notification_button.dart';
import 'package:classified_app/global/widgets/profile_button.dart';
import 'package:classified_app/ui/banner-ad/bloc/banner_bloc.dart';
import 'package:classified_app/ui/carousel/bloc/carousel_bloc.dart';
import 'package:classified_app/ui/categories_list/bloc/category_list_bloc.dart';
import 'package:classified_app/ui/home/widgets/banner_status.dart';
import 'package:classified_app/utils/buttons.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/data/models/banner.dart';
import 'package:classified_app/global/widgets/button.dart';
import 'package:classified_app/global/widgets/search_field.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/ui/drawer/app_drawer.dart';
import 'package:classified_app/ui/home/widgets/category_grid.dart';
import 'package:classified_app/router.dart';

import 'bloc/home_bloc.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        drawer: AppDrawer(),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: ConstPadding.all12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SpaceHeightWithValue(height: 10),
                  BlocBuilder<CarouselBloc, CarouselState>(
                    builder: (context, state) {
                      if (state is CarouselLoaded) {
                        return AdvertisemntSlider(
                          carousels: state.carousels,
                        );
                      } else {
                        return Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: CarouselShimmer());
                      }
                    },
                  ),
                  SpaceHeightWithValue(height: 10),
                  SearchField(
                    text: '',
                  ),
                  SpaceHeightWithValue(height: 10),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoaded) {
                        return _buildCategories(state.categories, context);
                      }
                      return Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: GridShimmer());
                    },
                  ),
                  SpaceHeightWithValue(height: 20),
                  BlocBuilder<BannerBloc, BannerState>(
                    builder: (context, state) {
                      if (state is BannerLoaded) {
                        return Column(
                          children: state.banners
                              .map((e) => BannerAdTile(
                                    bannerAd: e,
                                  ))
                              .toList(),
                        );
                      }
                      return Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: BannerShimmer());
                    },
                  ),
                  SpaceHeightWithValue(height: 2),
                ],
              ),
            ),
          );
        }));
  }

  Widget _buildCategories(
      List<CategoryModel> categories, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: [
          (categories.length > 0)
              ? CategoryGrid(
                  categories: categories,
                )
              : Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(ConstantStrings.noCategories),
                ),
          SpaceHeightWithValue(height: 20),
          Button(
            textColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            bgColor: Colors.transparent,
            onTap: () {
              BlocProvider.of<CategoryListBloc>(context).add(LoadCategories());
              NavRouter.navKey!.currentState!
                  .pushNamed(RouteStrings.CategoryList);
            },
            text: ConstantStrings.showMore,
          ),
          SpaceHeightWithValue(height: 15),
          submitButton(() {
            BlocProvider.of<CategoryListBloc>(context).add(BhiwandiSpecified());
            NavRouter.navKey!.currentState!
                .pushNamed(RouteStrings.CategoryList);
          }, context, 'BHIWANDI SOCIAL SERVICE!')
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      title: DashboardLogo(),
      actions: [
        NotificationButton(),
        ProfileButton(),
        SpaceWidthWithValue(
          width: 15,
        )
      ],
    );
  }
}

class BannerAdTile extends StatelessWidget {
  final BannerAd? bannerAd;
  const BannerAdTile({
    Key? key,
    this.bannerAd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavRouter.navKey!.currentState!
            .pushNamed(RouteStrings.BannerAd, arguments: bannerAd);
      },
      child: Container(
        margin: ConstPadding.onlyB10,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(10),
          //
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.maxFinite,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      UrlConcat.concatUrl(
                          bannerAd?.images?.first ?? ImagePaths.noImageUrl),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : ImageLoading(
                                height: 150,
                                width: double.maxFinite,
                              );
                      },
                    )),
              ),
              SpaceHeightWithValue(height: 10),
              Container(
                padding: ConstPadding.symmH15V7,
                child: Column(
                  children: [
                    Text(
                      bannerAd?.title ?? 'Title',
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    Text(
                      bannerAd?.shortDescription ?? 'short description',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    BannerStatus(bannerAd: bannerAd),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
