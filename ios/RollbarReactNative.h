#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface RollbarReactNative : NSObject <RCTBridgeModule>

+ (void)start;

- (void)start:(NSDictionary *)options; 

- (void)setUser:(NSDictionary *)userInfo;
- (void)clearUser;

@end
