import 'dart:convert';

import 'package:classified_app/const/strings.dart';
import 'package:classified_app/data/models/best_deal.dart';
import 'package:classified_app/data/models/notification_viewed.dart';
import 'package:classified_app/data/models/review.dart';
import 'package:classified_app/data/models/user_model.dart';
import 'package:classified_app/environment/environment.dart';
import 'package:classified_app/environment/i_environment_switch.dart';

import 'interfaces/handler.dart';
import 'network_request.dart';

class ExecutionHandler {
  final IEnvironmentManager _environmentManager;
  static const String _devUrl = ConstantStrings.baseUrl;
  static const String _prodUrl = ConstantStrings.baseUrl;
  final Handler _handler;

  ExecutionHandler(
    this._environmentManager,
    this._handler,
  );

  String get _url =>
      (_environmentManager.environment == Environment.dev) ? _devUrl : _prodUrl;

  Future<String?> checkUserOnServer(
    String firebaseId,
  ) async {
    var testRequest = NetworkRequest(
        key: firebaseId, url: _url + '/api/User/Get?uid=$firebaseId');

    String response;
    try {
      response = await _handler.get(testRequest, forceData: true);
      String shouldContain = "model";
      if (_verifyResponse(response, shouldContain)) {
        return jsonEncode(jsonDecode(response)[shouldContain]);
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<String> getFaqsList() async {
    String response;
    try {
      response = await _handler
          .get(NetworkRequest(url: _url + '/api/General/FAQs', key: 'FAQS'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<bool> sendUserToDatabase(UserModel user) async {
    try {
      await _handler.post(
          NetworkRequest(url: _url + '/api/User/Post', key: '${user.uid}'),
          user.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> sendReview(ReviewModel reviewModel, int userId) async {
    try {
      await _handler.post(
          NetworkRequest(
              url: _url + '/api/ClassifiedRating/SubmitReview?id=$userId',
              key: 'REVIEW'),
          reviewModel.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<String> bestDeal(BestDealModel bestDealModel) async {
    String response;
    try {
      response = await _handler.post(
          NetworkRequest(url: _url + '/api/BestDeal/Post', key: 'BEST_DEAL'),
          bestDealModel.toJson());
    } catch (e) {
      print(e);
      throw (e);
    }
    return response;
  }

  Future<void> updateUserImage(UserModel user) async {
    try {
      await _handler.post(
          NetworkRequest(
              url: _url + '/api/User/UpdateProfile', key: '${user.uid}'),
          jsonEncode({"UserId": user.id, "ImageUrl": user.image}));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
  }

  Future<String> getSystemSettings() async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url + '/api/SystemSetting/Get', key: 'SYSTEM_SETTINGS'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getAppMessages() async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url + '/api/AppMessage/GetAll', key: 'APP_MESSAGES'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getAllCategories({bool isSpecialCategory = false}) async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url + '/api/Category/Get?isSpecialCategory=$isSpecialCategory',
          key: 'CATEGORIES_$isSpecialCategory'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getCategoriesForGrid() async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url + '/api/HomeGrid/Get', key: 'CATEGORIES_GRID'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getAllSubCategories(int categoryId) async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url + '/api/SubCategory/Get?CategoryId=$categoryId',
          key: 'SUB_CATEGORIES_$categoryId'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getImagesForCarousel() async {
    String response;
    try {
      response = await _handler.get(
          NetworkRequest(url: _url + '/api/ImageCarousel/Get', key: 'IMAGES'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getNotificationsList(int? id) async {
    String response;
    try {
      response = await _handler.get(
          NetworkRequest(
              url: _url + '/api/notification?customerId=$id',
              key: 'NOTIFICATIONS_LIST_$id'),
          forceData: true);
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<void> notificationViewed(
      NotificationViewedModel notificationViewedModel) async {
    try {
      await _handler.post(
          NetworkRequest(
              url: _url + '/api/viewnotification', key: 'NOTIFICATION_VIEW'),
          notificationViewedModel.toJson());
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
  }

  Future<String> getBanners(int id) async {
    String response;
    try {
      response = await _handler.get(
          NetworkRequest(
              url: _url + '/api/banners/get?customerId=$id', key: 'BANNERS'),
          forceData: true);
    } catch (e) {
      throw e;
    }
    return response;
  }

  Future<String> getClassifiedsBySubCategoryId(
      int categoryId, double lat, double lng) async {
    String response;
    try {
      response = await _handler.get(
          NetworkRequest(
              url: _url +
                  '/api/Classified/ByCategory?SubCategoryId=$categoryId&Lat=$lat&Long=$lng',
              key: 'CLASSIFIED_S_$categoryId'),
          forceData: true);
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getClassifiedsById(int id, double lat, double lng) async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url +
              '/api/Classified/ByClassifiedId?classifiedId=$id&Lat=$lat&Long=$lng',
          key: 'CLASSIFIED_$id'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getClassifiedByName(
      String name, double lat, double lng) async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url +
              '/api/Classified/ByName?SearchName=$name&Lat=$lat&Long=$lng',
          key: 'CLASSIFIED_$name'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getArticlesBySubCategoryId(int categoryId) async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url + '/api/Article/ByCategory?SubCategoryId=$categoryId',
          key: 'ARTICLES_S_$categoryId'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getArticlesById(int id) async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url + '/api/Article/ByArticleId?articleId=$id',
          key: 'ARTICLE_$id'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<String> getArticlesByName(String name) async {
    String response;
    try {
      response = await _handler.get(NetworkRequest(
          url: _url + '/api/Article/ByName?SearchName=$name',
          key: 'ARTICLE_$name'));
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
    return response;
  }

  Future<void> likeBanner(String request) async {
    try {
      await _handler.post(
          NetworkRequest(url: _url + '/api/bannerlikes', key: 'BANNERS-like'),
          request);
    } catch (e) {
      print('this is exception$e');
      throw e;
    }
  }

  bool _verifyResponse(String response, String shouldContain) {
    Map<String, dynamic> finalResponse = jsonDecode(response);
    if (finalResponse.containsKey(shouldContain)) {
      return true;
    } else {
      return false;
    }
  }
}
