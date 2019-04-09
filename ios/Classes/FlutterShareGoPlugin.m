#import "FlutterShareGoPlugin.h"
#import "ShareHelper.h"
#import <Social/Social.h>


@interface FlutterShareGoPlugin()
@property (nonatomic, strong)UIViewController * rootViewController;
@end

@implementation FlutterShareGoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_share_go"
            binaryMessenger:[registrar messenger]];
  FlutterShareGoPlugin* instance = [[FlutterShareGoPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }
  else if ([@"shareToFBPlatform" isEqualToString:call.method]) {
      NSDictionary *arguments = [call arguments];
      NSString * shareContent = arguments[@"shareContent"];
      NSString * shareUrl = arguments[@"shareUrl"];
      [ShareHelper shareToPlatformType:SLServiceTypeFacebook withContent:shareContent withShareUrl:shareUrl];
      result(nil);
  }
  else if ([@"shareToTwitterPlatform" isEqualToString:call.method]) {
      NSDictionary *arguments = [call arguments];
      NSString * shareContent = arguments[@"shareContent"];
      NSString * shareUrl = arguments[@"shareUrl"];
      [ShareHelper shareToPlatformType:SLServiceTypeTwitter withContent:shareContent withShareUrl:shareUrl];
      result(nil);
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}
@end
