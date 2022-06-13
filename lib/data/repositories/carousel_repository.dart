import 'dart:convert';

import 'package:classified_app/data/models/carousel.dart';
import 'package:classified_app/data/repositories/interfaces/i_carousel_repository.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';

class CarouselRepository extends ICarouselRepository {
  ExecutionHandler _handler;
  CarouselRepository(
    this._handler,
  );
  @override
  Future<List<Carousel>> get carousels async {
    String response = await _handler.getImagesForCarousel();
    return _convertToModel(response);

    // return MockCarousel.carousels; //*MOCK
  }

  List<Carousel> _convertToModel(String response) {
    List _rawJsonList = jsonDecode(response);
    List<Carousel> _images = [];
    _rawJsonList.forEach((element) {
      _images.add(Carousel.fromMap(element));
    });
    return _images;
  }
}
  