#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif
#import <Rollbar/Rollbar.h>

@interface RollbarReactNative : NSObject <RCTBridgeModule>

+ (void)initWithAccessToken:(NSString *)accessToken;
+ (void)initWithAccessToken:(NSString *)accessToken configuration:(RollbarConfiguration *)config;
- (void)init:(NSDictionary *)options;
- (void)setPerson:(NSDictionary *)personInfo;
- (void)clearPerson;

@end
