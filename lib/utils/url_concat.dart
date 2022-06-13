import 'package:classified_app/const/strings.dart';

class UrlConcat {
  static String concatUrl(String url) {
    if (url.startsWith('http')) {
      return url;
    } else {
      return ConstantStrings.baseUrl + url;
    }
  }
}
