import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classified_app/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerInitial());

  @override
  Stream<DrawerState> mapEventToState(
    DrawerEvent event,
  ) async* {
    if (event is LoadUser) {
      // UserModel userModel = await UserReps().userReps;
      // yield DrawerInState(userModel: userModel);
    }
  }
}
