import 'package:classified_app/global/widgets/close_button.dart';
import 'package:classified_app/global/widgets/web_view_widget.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  final String articleUrl;
  const ArticleView({
    Key? key,
    required this.articleUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButtonCircle(),
      ),
      body: WebViewWidget(
        url: UrlConcat.concatUrl(articleUrl),
      ),
    );
  }
}
