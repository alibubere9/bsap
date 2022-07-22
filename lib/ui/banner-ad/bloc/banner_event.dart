part of 'banner_bloc.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();

  @override
  List<Object> get props => [];
}

class LoadBanner extends BannerEvent {}

class LikeBannerAd extends BannerEvent {
  final BannerAd? bannerAd;

  LikeBannerAd(
    this.bannerAd,
  );

  @override
  List<Object> get props => [bannerAd!];
}

class UnlikeBannerAd extends BannerEvent {
  final BannerAd? bannerAd;

  UnlikeBannerAd(
    this.bannerAd,
  );

  @override
  List<Object> get props => [bannerAd!];
}
