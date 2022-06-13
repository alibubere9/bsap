import 'dart:convert';

import 'package:classified_app/data/models/banner.dart';
import 'package:classified_app/data/models/request_models/banner_like.dart';
import 'package:classified_app/data/repositories/interfaces/i_banner_repository.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';
import 'package:classified_app/services/interfaces/i_user_service.dart';

class BannerRepository implements IBannerRepository {
  final ExecutionHandler _handler;
  final IUserService _userService;
  BannerRepository(
    this._handler,
    this._userService,
  );
  Future<List<BannerAd>> get banners async {
    String response = await _handler.getBanners(_userService.userId);
    return _convertToModel(response);
    // return MockBannerAds.banners; //*mock
  }

  Future<BannerAd> like(BannerAd? bannerAd) async {
    BannerAd _updated =
        bannerAd!.copyWith(likeCount: bannerAd.likeCount! + 1, isLiked: true);
    await _handleApi(_updated);
    return _updated;
  }

  Future<void> _handleApi(BannerAd _updated) async {
    BannerLike _bannerLike = BannerLike(
        customerId: _userService.userId,
        bannerId: _updated.id!,
        isLiked: _updated.isLiked!);
    _handler.likeBanner(_bannerLike.toJson());
  }

  Future<BannerAd> unlike(BannerAd? bannerAd) async {
    BannerAd _updated =
        bannerAd!.copyWith(likeCount: bannerAd.likeCount! - 1, isLiked: false);
    _handleApi(_updated);
    return _updated;
  }

  List<BannerAd> _convertToModel(String response) {
    List _rawJsonList = jsonDecode(response);
    List<BannerAd> _banners = [];
    _rawJsonList.forEach((element) {
      _banners.add(BannerAd.fromMap(element));
    });
    return _banners;
  }
}
