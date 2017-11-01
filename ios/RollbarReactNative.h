#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif
#import <Rollbar/Rollbar.h>

@interface RollbarReactNative : NSObject <RCTBridgeModule>

+ (void)initWithAccessToken:(NSString *)accessToken;
+ (void)initWithAccessToken:(NSString *)accessToken configuration:(RollbarConfiguration *)config;

+ (void)logWithLevel:(NSString*)level message:(NSString*)message;
+ (void)logWithLevel:(NSString*)level message:(NSString*)message data:(NSDictionary*)data;
+ (void)logWithLevel:(NSString*)level data:(NSDictionary*)data;

+ (void)debugWithMessage:(NSString*)message;
+ (void)debugWithMessage:(NSString*)message data:(NSDictionary*)data;
+ (void)debugWithData:(NSDictionary*)data;

+ (void)infoWithMessage:(NSString*)message;
+ (void)infoWithMessage:(NSString*)message data:(NSDictionary*)data;
+ (void)infoWithData:(NSDictionary*)data;

+ (void)warningWithMessage:(NSString*)message;
+ (void)warningWithMessage:(NSString*)message data:(NSDictionary*)data;
+ (void)warningWithData:(NSDictionary*)data;

+ (void)errorWithMessage:(NSString*)message;
+ (void)errorWithMessage:(NSString*)message data:(NSDictionary*)data;
+ (void)errorWithData:(NSDictionary*)data;

+ (void)criticalWithMessage:(NSString*)message;
+ (void)criticalWithMessage:(NSString*)message data:(NSDictionary*)data;
+ (void)criticalWithData:(NSDictionary*)data;

- (void)init:(NSDictionary *)options;
- (void)setPerson:(NSDictionary *)personInfo;
- (void)clearPerson;

@end
