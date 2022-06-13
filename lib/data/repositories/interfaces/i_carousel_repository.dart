import 'package:classified_app/data/models/carousel.dart';

abstract class ICarouselRepository{
  Future<List<Carousel>> get carousels;
}