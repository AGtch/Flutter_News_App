import 'package:flutter/material.dart';
import 'package:flutter_news/constants/themes/colors.dart';
import 'package:flutter_news/injection.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          WebView(
            initialUrl: widget.url,
            zoomEnabled: true,
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          (isLoading)
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: getIt.get<ColorsApp>().gray,
                  color: getIt.get<ColorsApp>().mainColor,
                ))
              : Stack(),
        ]),
      ),
    );
  }
}
