part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {
  @override
  List<Object> get props => [];
}

class BannerLoaded extends BannerState {
  final List<BannerAd> banners;

  BannerLoaded(
    this.banners,
  );
  @override
  List<Object> get props => [banners];
}
