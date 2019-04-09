//
//  ShareHelper.h
//  flutter_share_go
//
//  Created by 10996 on 2019/4/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareHelper : NSObject
+(void)shareToPlatformType:(NSString *)platformType withContent:(NSString *)content withShareUrl:(NSString*)url;
@end

NS_ASSUME_NONNULL_END
