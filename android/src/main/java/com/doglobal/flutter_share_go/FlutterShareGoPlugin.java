package com.doglobal.flutter_share_go;

import android.app.Activity;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterShareGoPlugin */
public class FlutterShareGoPlugin implements MethodCallHandler {

  private Activity mActivity;
  private FlutterShareGoPlugin(Activity context) {
    mActivity = context;
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_share_go");
    channel.setMethodCallHandler(new FlutterShareGoPlugin(registrar.activity()));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("shareToFBPlatform")) {
      String content = call.argument("shareContent");
      String shareUrl = call.argument("shareUrl");
      ShareHelper.shareTextToChannel(mActivity, ShareHelper.CHANNEL_FACEBOOK_PKG_NAME, content, shareUrl);
    } else if (call.method.equals("shareToTwitterPlatform")) {
      String content = call.argument("shareContent");
      String shareUrl = call.argument("shareUrl");
      ShareHelper.shareTextToChannel(mActivity, ShareHelper.CHANNEL_TWITTER_PKG_NAME, content, shareUrl);
    }
    else {
      result.notImplemented();
    }
  }

}
