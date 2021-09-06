
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {


  final String? url;
  final String? title;
  WebViewScreen(this.url , this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title! , style: TextStyle(color: Colors.black87),),
      ),
      body: WebView(
        initialUrl: url!,
      ),
    );
  }
}
