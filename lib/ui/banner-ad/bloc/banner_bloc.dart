import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classified_app/data/repositories/interfaces/i_banner_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/banner.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final IBannerRepository bannerRepository;
  BannerBloc(
    this.bannerRepository,
  ) : super(BannerInitial());

  @override
  Stream<BannerState> mapEventToState(
    BannerEvent event,
  ) async* {
    if (event is LoadBanner) {
      yield BannerLoading();
      final List<BannerAd> banners =    await bannerRepository.banners;
      yield BannerLoaded(banners);
    } else if (event is UnlikeBannerAd) {
      final List<BannerAd> banners = await bannerRepository.banners;
      final BannerAd bannerAd = await bannerRepository.unlike(event.bannerAd);
      final List<BannerAd> update = _handleLikeChange(banners, bannerAd);
      yield BannerLoaded(update);
    } else if (event is LikeBannerAd) {
      final List<BannerAd> banners = await bannerRepository.banners;
      final BannerAd bannerAd = await bannerRepository.like(event.bannerAd);
      final List<BannerAd> update = _handleLikeChange(banners, bannerAd);
      yield BannerLoaded(update);
    }
  }

  List<BannerAd> _handleLikeChange(List<BannerAd> banners, BannerAd bannerAd) {
    BannerAd banner =
        banners.firstWhere((element) => element.id == bannerAd.id);
    int index = banners.indexOf(banner);
    List<BannerAd> update = banners..[index] = bannerAd;
    return update;
  }
}
