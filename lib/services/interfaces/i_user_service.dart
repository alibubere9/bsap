import 'package:classified_app/data/models/user_model.dart';

abstract class IUserService {
  UserModel get user;
  int get userId;
  String get firebaseId;
}
