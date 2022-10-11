import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io' show Platform;

import 'package:youtube_downloader/download.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({super.key});

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

  }

  final link = 'https://www.youtube.com';
  WebViewController? webViewController;
  bool showDownloadButton = false;

void checkUrl() async {
    if (await webViewController!.currentUrl() == "https://m.youtube.com/") {
      setState(() {
        showDownloadButton = false;
      });
    } else {
      setState(() {
        showDownloadButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkUrl();
    return Scaffold(
      backgroundColor: Color(0xffcd1d25),
      body: WebView(
        initialUrl: link,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          setState(() {
            webViewController = controller;
          });
        },
      ),
      floatingActionButton: showDownloadButton == false
          ? Container()
          : FloatingActionButton(
              onPressed: () async {
                final url = await webViewController!.currentUrl();
                  final title = await webViewController!.getTitle();

                  ///Download the video
                  Download().downloadVideo(url!, "$title");
              },
              backgroundColor: Color(0xffcd1d25),
              child: Icon(Icons.download),
            ),
    );
  }
}
