import 'package:classified_app/data/models/user_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_user_repository.dart';
import 'package:classified_app/services/interfaces/i_user_service.dart';

class UserService implements IUserService {
  final IUserRepository _userRepository;

  UserService(this._userRepository);
  @override
  String get firebaseId => _userRepository.user?.uid ?? "";

  @override
  UserModel get user => _userRepository.user ?? UserModel();

  @override
  int get userId => _userRepository.user?.id ?? 0;
}
