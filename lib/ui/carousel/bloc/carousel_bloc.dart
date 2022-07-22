import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/carousel.dart';
import 'package:classified_app/data/repositories/interfaces/i_carousel_repository.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  final ICarouselRepository _carouselRepository;
  CarouselBloc(
    this._carouselRepository,
  ) : super(CarouselLoading());

  @override
  Stream<CarouselState> mapEventToState(
    CarouselEvent event,
  ) async* {
    if (event is LoadCarousels) {
      yield CarouselLoading();
      List<Carousel> _carousels = await _carouselRepository.carousels;
      yield CarouselLoaded(_carousels);
    }
  }
}
