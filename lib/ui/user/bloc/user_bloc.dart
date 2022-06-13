import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/user_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_user_repository.dart';
import 'package:classified_app/services/interfaces/i_notification_service.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository userRepository;
  final SharedPreferences sharedPreferences;
  final INotificationService notificationService;
  UserBloc(
      this.userRepository, this.sharedPreferences, this.notificationService)
      : super(AuthUserLoading());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    String? firebaseId = await userRepository.userId;
    String notificationToken = await notificationService.token ?? 'NO TOKEN';
    UserModel user = await userRepository.checkUserOnTheServer(firebaseId!);
    if (event is CheckUserEvent) {
      if (user.username == null) {
        yield AuthUserLoading();
        yield NewUserState(userRepository.phoneNumber);
      } else {
        yield UserLoading();
        await userRepository.storeUser(
            user.copyWith(deviceId: notificationToken),
            apiCall: (notificationToken != 'NO TOKEN'));
        yield RegisteredUserState(user: user);
      }
    } else if (event is UpdateUserEvent) {
      yield AuthUserLoading();
      UserModel _updated = event.user.copyWith(
          uid: await userRepository.userId,
          id: userRepository.user?.id ?? null,
          image: user.image,
          deviceId: notificationToken);
      if (await userRepository.storeUser(_updated)) {
        yield RegisteredUserState(user: _updated);
      }
    }

    // if (event is UpdateUserEvent) {
    //   yield UserLoading();
    //   await userRepository.storeUser(event.user);
    //   print(event.user);
    //   yield RegisteredUserState(
    //     user: event.user,
    //   ); //todo add firebaseId and userId.
    // }
    // else if (event is DeleteNameEvent) {
    //   yield AuthUserLoading();
    //   // UserModel tempUser =

    //   yield RegisteredUserState(
    //       user: user,
    //       isNamed: true,
    //       isEmail: event.email,
    //       isNumbered: event.phoneNumber);
    // } else if (event is DeletePhoneNumber) {
    //   yield AuthUserLoading();

    //   yield RegisteredUserState(
    //       user: user,
    //       isNumbered: true,
    //       isEmail: event.email,
    //       isNamed: event.userName);
    // } else if (event is DeleteEmail) {
    //   yield UserLoading();
    //   // UserModel tempUser =

    //   yield RegisteredUserState(
    //       user: user,
    //       isEmail: true,
    //       isNamed: event.userName,
    //       isNumbered: event.phoneNumber);
    // }
    else if (event is UpdateUserImage) {
      yield AuthUserLoading();
      String image = await userRepository.uploadImage(event.file);
      UserModel updatedUser = user.copyWith(image: image);
      await userRepository.updateUserImage(image);
      print('below updateUserImage function');
      await userRepository.storeUser(updatedUser);
      print('below storeUser function');
      yield RegisteredUserState(user: updatedUser);
    } else {
      yield AuthUserLoading();
      yield RegisteredUserState(user: user);
    }
  }
}
