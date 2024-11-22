import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleExternalWebView extends StatefulWidget {
  const ArticleExternalWebView({super.key, required this.url});

  final String url;


  @override
  State<ArticleExternalWebView> createState() => _ArticleExternalWebViewState();
}


class _ArticleExternalWebViewState extends State<ArticleExternalWebView> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.url)); // Accessing url via widget.url
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter to include a WebView
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400, // Set height for the WebView
              child: WebViewWidget(controller: controller,
              ),
            ),
          ),
        ],),);
  }
}