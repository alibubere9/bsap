import 'package:classified_app/data/models/carousel.dart';

class MockCarousel {
  static List<Carousel> _carousels = [
    Carousel(
        id: 1,
        imageUrl:
            "https://assets.justinmind.com/wp-content/uploads/2018/11/Lorem-Ipsum-alternatives.png",
        classifiedId: 1),
    Carousel(
        id: 2,
        imageUrl:
            "https://placeholder.com/wp-content/uploads/2019/06/lorem-ipsum.png",
        classifiedId: 2),
    Carousel(
        id: 3,
        imageUrl: "https://lorem2.com/wp-content/uploads/2018/09/lorem2.png",
        classifiedId: 3),
    // Carousel(
    //     id: 4,
    //     imageUrl:
    //         "https://placeholder.com/wp-content/uploads/2019/06/lorem-ipsum.png",
    //     classifiedId: 4),
    // Carousel(
    //     id: 5,
    //     imageUrl: "https://lorem2.com/wp-content/uploads/2018/09/lorem2.png",
    //     classifiedId: 5),
  ];

  static List<Carousel> get carousels => _carousels;
}
