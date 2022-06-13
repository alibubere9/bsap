import 'dart:io';

import 'package:classified_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserRepository {
  User? getUser();
  bool get isLoggedIn;
  Future<UserModel> checkUserOnTheServer(String firebaseId);
  Future<String?> get userId;
  String get phoneNumber;
  Future<void> signOut();
  UserModel? get user;
  Future<void> updateUser(UserModel user);
  Future<bool> storeUser(UserModel user, {bool apiCall = true});
  Future<void> signInFirebase(AuthCredential credential);
  Future<bool> updateUserImage(String url);

  Future<void> sendOtp(
      String? phoneNumber,
      Duration timeOut,
      PhoneVerificationFailed phoneVerificationFailed,
      PhoneVerificationCompleted phoneVerificationCompleted,
      PhoneCodeSent phoneCodeSent,
      PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout);
  Future<UserCredential> verifyAndLogin(String verificationId, String? smsCode);

  //UserModel userInstance(UserModel userIns);
  Future<String> uploadImage(File file);
}
