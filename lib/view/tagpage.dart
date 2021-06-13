import 'dart:convert' show Encoding, utf8;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TagPage extends StatefulWidget {
  @override
  _TagPageState createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  late WebViewController _controller;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '#ストVラウンジ募集',
        ),
      ),
      body: Stack(
        children: <Widget>[
          ClipRect(
            child: WebView(
              gestureRecognizers: {
                Factory(() => PlatformViewVerticalGestureRecognizer()),
              },
              onWebViewCreated: (WebViewController webViewController) async {
                _controller = webViewController;
                await _loadHtmlFromAssets();
              },
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  _isLoading = false;
                });
              },
            ),
          ),
          _isLoading
              ? Container(
                  color: Colors.white,
                  alignment: FractionalOffset.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      CircularProgressIndicator(),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Future _loadHtmlFromAssets() async {
    final fileText = await rootBundle.loadString('assets/twitterpage.html');
    await _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}

class PlatformViewVerticalGestureRecognizer
    extends VerticalDragGestureRecognizer {
  PlatformViewVerticalGestureRecognizer({PointerDeviceKind? kind})
      : super(kind: kind);

  Offset _dragDistance = Offset.zero;

  @override
  void addPointer(PointerEvent event) {
    startTrackingPointer(event.pointer);
  }

  @override
  void handleEvent(PointerEvent event) {
    _dragDistance = _dragDistance + event.delta;
    if (event is PointerMoveEvent) {
      final dy = _dragDistance.dy.abs();
      final dx = _dragDistance.dx.abs();

      if (dy > dx && dy > kTouchSlop) {
        resolve(GestureDisposition.accepted);
        _dragDistance = Offset.zero;
      } else if (dx > kTouchSlop && dx > dy) {
        stopTrackingPointer(event.pointer);
        _dragDistance = Offset.zero;
      }
    }
  }

  @override
  String get debugDescription => 'horizontal drag (platform view)';

  @override
  void didStopTrackingLastPointer(int pointer) {}
}
