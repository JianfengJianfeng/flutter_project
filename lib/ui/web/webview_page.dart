import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String url;

  const WebViewPage({
    Key? key,
    @required this.title = '',
    @required this.url = '',
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  var isLoading = true;
  var loadingProgress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              loadingProgress = progress;
              isLoading = progress < 100;
            });
          },
          onPageStarted: (url) {
            setState(() => isLoading = true);
          },
          onPageFinished: (url) {
            setState(() => isLoading = false);
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          await _controller.goBack();
          return false; // 阻止默认返回行为
        }
        return true; // 允许退出页面
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          title: Text(widget.title),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: isLoading
                ? LinearProgressIndicator(
              value: loadingProgress / 100, // 显示加载进度
            )
                : const Divider(height: 1.0),
          ),
        ),
        body: WebViewWidget(controller: _controller),
      ),
    );
  }

}