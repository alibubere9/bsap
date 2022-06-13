part of 'carousel_bloc.dart';

abstract class CarouselState extends Equatable {
  const CarouselState();
  
  @override
  List<Object> get props => [];
}

class CarouselLoading extends CarouselState {}
class CarouselLoaded extends CarouselState {
  final List<Carousel> carousels;

  CarouselLoaded(this.carousels);

  @override
  List<Object> get props => [carousels];
}
