import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zmtest/core/di/di.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zmtest/features/offline/presentation/pages/fish_home_page.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  late final String? urlWebView;
  bool _isLoading = true;
  bool _isFirstLoad = true;
  @override
  void initState() {
    super.initState();
    urlWebView = getIt<SharedPreferences>().getString('url')!;
    controller = WebViewController();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        if (_isFirstLoad) {
          setState(() {
            _isLoading = true;
          });
        }
      }, onPageFinished: (url) {
        setState(
          () {
            _isFirstLoad = false;
            _isLoading = false;
          },
        );
      }, onWebResourceError: (e) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => FishHomePage()));
      }));
    controller.loadRequest(Uri.parse(urlWebView!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
