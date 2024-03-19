import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var webViewCont = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..runJavaScript("window.scrollTo({top: 0, behavior: 'smooth'});")
      ..getScrollPosition()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            // var controller;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url
                .startsWith('https://www.tevini.co.uk/password/reset')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.tevini.co.uk/password/reset'));
    // var controller;  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Forget Password',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: WebViewWidget(controller: webViewCont)),
    );
  }
}

/*
 SafeArea(

          child:  Container(


        color: Colors.orangeAccent.shade100.withOpacity(0.2),
          margin: EdgeInsets.symmetric(vertical: 0),
          child: Obx(()=>controller.isLoading.value==true?WebViewWidget(controller: webViewCont):Center( child: CircularProgressIndicator(),))))
*/