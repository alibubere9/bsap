import 'dart:math';

import 'package:classified_app/data/models/banner.dart';

class MockBannerAds {
  static List<BannerAd> _banners = List.generate(
    5,
    (index) => BannerAd(
      id: index + 1,
      isLiked: index.isEven,
      likeCount: 50 + Random().nextInt(100),
      longDescription:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      shortDescription:
          "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).".substring(0,150),
      images: [
        "https://assets.justinmind.com/wp-content/uploads/2018/11/Lorem-Ipsum-alternatives.png",
        "https://placeholder.com/wp-content/uploads/2019/06/lorem-ipsum.png",
        "https://lorem2.com/wp-content/uploads/2018/09/lorem2.png"
      ],
      title: 'Lorep ipsum banner ad $index',
    ),
  );

  static List<BannerAd> get banners => _banners;
}
