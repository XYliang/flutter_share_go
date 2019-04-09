import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_share_go/flutter_share_go.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_share_go');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterShareGo.platformVersion, '42');
  });
}
