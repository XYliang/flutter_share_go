//
//  ShareHelper.m
//  flutter_share_go
//
//  Created by 10996 on 2019/4/8.
//

#import "ShareHelper.h"
#import <Social/Social.h>
#import "PackageUtil.h"

@implementation ShareHelper

/*
 SOCIAL_EXTERN NSString *const SLServiceTypeTwitter NS_AVAILABLE(10_8, 6_0);//Twitter
 SOCIAL_EXTERN NSString *const SLServiceTypeFacebook NS_AVAILABLE(10_8, 6_0);//Facebook
 SOCIAL_EXTERN NSString *const SLServiceTypeSinaWeibo NS_AVAILABLE(10_8, 6_0);
 SOCIAL_EXTERN NSString *const SLServiceTypeTencentWeibo NS_AVAILABLE(10_9, 7_0);
 SOCIAL_EXTERN NSString *const SLServiceTypeLinkedIn NS_AVAILABLE(10_9, NA);
 */
+(void)shareToPlatformType:(NSString *)platformType withContent:(NSString *)content withShareUrl:(NSString*)url{
    if (platformType == nil || platformType.length == 0) {
        NSLog(@"unspecified platform");
        return;
    }
    if([platformType isEqualToString:SLServiceTypeFacebook] && ![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"fb://"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id284882215"]];
        NSLog(@"UnInstall facebook");
        return;
    }
    if([platformType isEqualToString:SLServiceTypeTwitter] && ![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id333903271"]];
        NSLog(@"UnInstall twitter");
        return;
    }
    // create controller for ServiceType
    SLComposeViewController *composeVC = [SLComposeViewController composeViewControllerForServiceType:platformType];
    // image
    // [composeVC addImage:[UIImage imageNamed:@"Nameless"]];
    // content
    [composeVC setInitialText:content];
    // share url
    [composeVC addURL:[NSURL URLWithString:url]];
    // share controller
    if([[[UIApplication sharedApplication] keyWindow].rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *vc = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
        [vc pushViewController:composeVC animated:YES];
    } else {
        UINavigationController *vc = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
        [vc presentViewController:composeVC animated:YES completion:nil];
    }
    // callback user hanlder
    composeVC.completionHandler = ^(SLComposeViewControllerResult result){
        if (result == SLComposeViewControllerResultDone) {
        }
        else if (result == SLComposeViewControllerResultCancelled) {
        }
    };
}

@end
