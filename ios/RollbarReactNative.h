#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif
#import "Rollbar.h"

@interface RollbarReactNative : NSObject <RCTBridgeModule>

+ (void)initWithAccessToken:(NSString *)accessToken;
+ (void)initWithAccessToken:(NSString *)accessToken configuration:(RollbarConfiguration *)config;
+ (void)initWithAccessToken:(NSString *)accessToken configuration:(RollbarConfiguration*)configuration enableCrashReporter:(BOOL)enable;

// Old methods for backwards compatability

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

// New interface

+ (void)log:(RollbarLevel)level message:(NSString*)message;
+ (void)log:(RollbarLevel)level message:(NSString*)message exception:(NSException*)exception;
+ (void)log:(RollbarLevel)level message:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data;
+ (void)log:(RollbarLevel)level message:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context;

+ (void)debug:(NSString*)message;
+ (void)debug:(NSString*)message exception:(NSException*)exception;
+ (void)debug:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data;
+ (void)debug:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context;

+ (void)info:(NSString*)message;
+ (void)info:(NSString*)message exception:(NSException*)exception;
+ (void)info:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data;
+ (void)info:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context;

+ (void)warning:(NSString*)message;
+ (void)warning:(NSString*)message exception:(NSException*)exception;
+ (void)warning:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data;
+ (void)warning:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context;

+ (void)error:(NSString*)message;
+ (void)error:(NSString*)message exception:(NSException*)exception;
+ (void)error:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data;
+ (void)error:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context;

+ (void)critical:(NSString*)message;
+ (void)critical:(NSString*)message exception:(NSException*)exception;
+ (void)critical:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data;
+ (void)critical:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context;

- (void)init:(NSDictionary *)options;
- (void)setPerson:(NSDictionary *)personInfo;
- (void)clearPerson;

@end
