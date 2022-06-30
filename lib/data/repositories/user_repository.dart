import 'dart:io';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'package:classified_app/data/models/user_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../router.dart';

const USER = 'user';
const PHONE_NUMBER = "PHONE_NUMBER";

class UserRepository implements IUserRepository {
  final FirebaseAuth _firebaseAuth;
  final Reference _storageRef;
  final SharedPreferences _sharedPreferences;
  final ExecutionHandler _handler;

  UserRepository(
    this._firebaseAuth,
    this._storageRef,
    this._sharedPreferences,
    this._handler,
  );
  UserModel? get user {
    String? user = _sharedPreferences.getString(USER);
    if (user != null) {
      return UserModel.fromJson(user);
    } else {
      return null;
    }
  }

  String get phoneNumber =>
      _sharedPreferences.getString(PHONE_NUMBER)?.substring(3) ?? '';

  Future<void> sendOtp(
      String? phoneNumber,
      Duration timeOut,
      PhoneVerificationFailed phoneVerificationFailed,
      PhoneVerificationCompleted phoneVerificationCompleted,
      PhoneCodeSent phoneCodeSent,
      PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout) async {
    _sharedPreferences.setString(PHONE_NUMBER, phoneNumber!);
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: timeOut,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout);
  }

  Future<void> signInFirebase(AuthCredential credential) async {
    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<UserCredential> verifyAndLogin(
      String verificationId, String? smsCode) async {
    AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode!);
    // _firebaseAuth.currentUser!.linkWithCredential(authCredential);
    return await _firebaseAuth.signInWithCredential(authCredential);
  }

  // signInWithPhoneNumber(String number){
  //   _firebaseAuth.signInWithPhoneNumber(number);
  // }

  User? getUser() {
    User? user = _firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    await _sharedPreferences.remove(USER);

    return _firebaseAuth.signOut();
  }

  Future<UserModel> checkUserOnTheServer(String firebaseId) async {
    String? _user = await _handler.checkUserOnServer(firebaseId);
    if (_user != null) {
      print(Future.value(UserModel.fromJson(_user)));
      return Future.value(UserModel.fromJson(_user));
    } else {
      return UserModel(birthdate: DateTime.now());
    }
  }

  // Future<UserModel> checkUserOnServer(String firebaseId) async {
  //   UserModel user = await _handler.checkUserOnServer(await userId);
  //   if (user.id != null) {
  //     return user;
  //   } else {
  //     return UserModel(birthdate: DateTime.now());
  //   }
  // }

  Future<String> get userId async {
    User _currentUser = getUser()!;
    String _id = _currentUser.uid;
    return _id;
  }

  Future<String> uploadImage(File file) async {
    String fileName = await userId;
    Reference fileReference = _storageRef.child(fileName);

    String downloadUrl =
        await fileReference.putFile(file).snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<bool> storeUser(UserModel user, {bool apiCall = true}) async {
    bool stored = false;
    if (user.id != null) {
      stored = await _sharedPreferences.setString(USER, user.toJson());
    }
    if (apiCall) {
      bool success = await _handler.sendUserToDatabase(user);
      stored = await _sharedPreferences.setString(USER, user.toJson());
      return success;
    }
    return stored;
  }

  Future<void> updateUser(UserModel user) async {
    await storeUser(user);
  }

  @override
  Future<bool> updateUserImage(String url) async {
    UserModel currentUser = user ?? UserModel();
    UserModel userModel = UserModel(id: currentUser.id, image: url);
    _handler.updateUserImage(userModel);
    return true;
  }

  @override
  bool get isLoggedIn => _sharedPreferences.getString(USER) != null;
}
