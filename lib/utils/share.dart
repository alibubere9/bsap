import 'package:classified_app/const/strings.dart';
import 'package:classified_app/data/models/article.dart';
import 'package:classified_app/data/models/banner.dart';
import 'package:classified_app/data/models/classified.dart';
import 'package:classified_app/utils/app_messages.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:share/share.dart';

void shareClassified(ClassifiedModel classified) {
  String share = AppMessagesManager.getMessage(AppMessageKeys.shareClassified)
      .replaceAll(
          ConstantStrings.classifiedNameTemplateString, classified.name!)
      .replaceAll(
          ConstantStrings.classifiedAddressTemplateString, classified.address!)
      .replaceAll(ConstantStrings.classifiedContactTemplateString,
          classified.contactNo!);
  Share.share(share); //* m Update text.
}

void shareArticle(ArticleModel article) {
  String share = AppMessagesManager.getMessage(AppMessageKeys.shareArticle)
      .replaceAll(ConstantStrings.articleTemplateString, article.heading ?? "")
      .replaceAll(ConstantStrings.urlTemplateString,
          UrlConcat.concatUrl(article.articleUrl ?? ""));
  Share.share(share); //* m Update text.
}

void shareBanner(BannerAd bannerAd) {
  String share = AppMessagesManager.getMessage(AppMessageKeys.shareBanner)
      .replaceAll(ConstantStrings.bannerTemplateString, bannerAd.title!);
  Share.share(share); //* Update text.
}
