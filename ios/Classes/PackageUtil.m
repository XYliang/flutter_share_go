//
//  PackageUtil.m
//  flutter_share_go
//
//  Created by 10996 on 2019/4/8.
//

#import "PackageUtil.h"

@implementation PackageUtil

+ (BOOL)isInstalledWithUrlScheme:(NSString *)urlScheme {
    if (urlScheme == nil || urlScheme.length == 0) {
        return false;
    }
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlScheme]];
}


@end
