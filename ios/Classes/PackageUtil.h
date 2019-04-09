//
//  PackageUtil.h
//  flutter_share_go
//
//  Created by 10996 on 2019/4/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PackageUtil : NSObject

// Is intalled specific app or not
+ (BOOL)isInstalledWithUrlScheme:(NSString *)urlScheme;

@end

NS_ASSUME_NONNULL_END
