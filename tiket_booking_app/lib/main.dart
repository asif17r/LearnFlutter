
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WebViewContainer(),
  ));
}

class WebViewContainer extends StatefulWidget {
  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _webViewController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable SSL certificate validation
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _webViewController.reload();
            },
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _webViewController.clearCache();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: "https://busbd.com.bd/",
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (String url) {
                setState(() {
                  _isLoading = true;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  _isLoading = false;
                });
              },
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onWebResourceError: (WebResourceError error) {
                print("Webview error: ${error.description}");
                // Handle web resource errors here
              },
              debuggingEnabled: true, // Enable debugging
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
