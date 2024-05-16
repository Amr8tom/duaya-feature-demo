import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../generated/l10n.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.appBarColor,
      appBar: AppBar(
        title: Text(
          S.current.termsOfUse,
          style: TextStyle(
              color: ColorRes.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
