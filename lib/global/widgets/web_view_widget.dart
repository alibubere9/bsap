import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'loading_indicator.dart';

class WebViewWidget extends StatefulWidget {
  final String url;

  const WebViewWidget({Key? key, required this.url}) : super(key: key);
  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  @override
  void initState() {
    _initialUrl = widget.url;
    super.initState();
  }

  WebViewController? controller;
  String? _initialUrl;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: _initialUrl,
            onPageStarted: (url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _isLoading = false;
              });
            },
            onWebViewCreated: (controller) async {
              setState(() {
                this.controller = controller;
              });
            },
          ),
          if (_isLoading)
            Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.6)),
                ),
                Center(child: LoadingIndicator()),
              ],
            )
        ],
      ),
    );
  }
}
