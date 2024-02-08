import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Scaffold(
      body: const SafeArea(
        child: WebView(
          initialUrl: "https://busbd.com.bd/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    ),
  ));
}
