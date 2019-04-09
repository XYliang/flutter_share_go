import 'dart:async';

import 'package:flutter/services.dart';

class FlutterShareGo {
  static const MethodChannel _channel =
      const MethodChannel('flutter_share_go');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> shareToFBPlatform(String shareContent, String shareUrl) async {
    assert(shareContent != null);
    assert(shareContent.isNotEmpty);
    final Map<String, dynamic> params = <String, dynamic> {
      'shareContent': shareContent,
      'shareUrl':shareUrl,
    };
    await _channel.invokeMethod("shareToFBPlatform", params);
  }

  static Future<void> shareToTwitterPlatform(String shareContent, String shareUrl) async {
    assert(shareContent != null);
    assert(shareContent.isNotEmpty);
    final Map<String, dynamic> params = <String, dynamic> {
      'shareContent': shareContent,
      'shareUrl':shareUrl,
    };
    await _channel.invokeMethod("shareToTwitterPlatform", params);
  }
}
