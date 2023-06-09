import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ItshMoviesWebView extends StatelessWidget {
  final String webUrl;

  const ItshMoviesWebView({Key? key, required this.webUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: webUrl,
        ),
      ),
    );
  }
}
