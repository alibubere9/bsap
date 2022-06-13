import 'package:classified_app/data/models/banner.dart';

abstract class IBannerRepository {
  Future<List<BannerAd>> get banners;
  Future<BannerAd> like(BannerAd? bannerAd);
  Future<BannerAd> unlike(BannerAd? bannerAd);
}
