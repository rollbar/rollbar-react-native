#import "RollbarReactNative.h"
#import <React/RCTConvert.h>
#import <Rollbar/Rollbar.h>

@implementation RollbarReactNative

+ (void)initWithAccessToken:(NSString *)accessToken {
  [RollbarReactNative initWithAccessToken:accessToken configuration:nil];
}

+ (void)initWithAccessToken:(NSString *)accessToken configuration:(RollbarConfiguration *)config {
  [Rollbar initWithAccessToken:accessToken configuration:config];
}

+ (void)logWithLevel:(NSString*)level message:(NSString*)message {
  [Rollbar logWithLevel:level message:message];
}

+ (void)logWithLevel:(NSString*)level message:(NSString*)message data:(NSDictionary*)data {
  [Rollbar logWithLevel:level message:message message:data];
}

+ (void)logWithLevel:(NSString*)level data:(NSDictionary*)data {
  [Rollbar logWithLevel:level data:data];
}

+ (void)debugWithMessage:(NSString*)message {
  [Rollbar debugWithMessage:message];
}

+ (void)debugWithMessage:(NSString*)message data:(NSDictionary*)data {
  [Rollbar debugWithMessage:message data:data];
}

+ (void)debugWithData:(NSDictionary*)data {
  [Rollbar debugWithData:data];
}

+ (void)infoWithMessage:(NSString*)message {
  [Rollbar infoWithMessage:message];
}

+ (void)infoWithMessage:(NSString*)message data:(NSDictionary*)data {
  [Rollbar infoWithMessage:message data:data];
}

+ (void)infoWithData:(NSDictionary*)data {
  [Rollbar infoWithData:data];
}

+ (void)warningWithMessage:(NSString*)message {
  [Rollbar warningWithMessage:message];
}

+ (void)warningWithMessage:(NSString*)message data:(NSDictionary*)data {
  [Rollbar warningWithMessage:message data:data];
}

+ (void)warningWithData:(NSDictionary*)data {
  [Rollbar warningWithData:data];
}

+ (void)errorWithMessage:(NSString*)message {
  [Rollbar errorWithMessage:message];
}

+ (void)errorWithMessage:(NSString*)message data:(NSDictionary*)data {
  [Rollbar errorWithMessage:message data:data];
}

+ (void)errorWithData:(NSDictionary*)data {
  [Rollbar errorWithData:data];
}

+ (void)criticalWithMessage:(NSString*)message {
  [Rollbar criticalWithMessage:message];
}

+ (void)criticalWithMessage:(NSString*)message data:(NSDictionary*)data {
  [Rollbar criticalWithMessage:(NSString*)message data:data];
}

+ (void)criticalWithData:(NSDictionary*)data {
  [Rollbar criticalWithData:data];
}

NSString* updateConfiguration(RollbarConfiguration *config, NSDictionary *options) {
  NSString *accessToken = nil;
  if (options[@"accessToken"]) {
    config.accessToken = [RCTConvert NSString:options[@"accessToken"]];
    accessToken = config.accessToken;
  }
  if (options[@"environment"]) {
    config.environment = [RCTConvert NSString:options[@"environment"]];
  }
  if (options[@"endpoint"]) {
    config.endpoint = [RCTConvert NSString:options[@"endpoint"]];
  }
  if (options[@"logLevel"]) {
    config.crashLevel = [RCTConvert NSString:options[@"endpoint"]];
  }
  return accessToken;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(init:(NSDictionary *)options) {
  RollbarConfiguration *config = [Rollbar currentConfiguration];
  if (config) {
    updateConfiguration(config, options);
    return;
  }
  config = [RollbarConfiguration configuration];
  NSString *accessToken = updateConfiguration(config, options);
  [Rollbar initWithAccessToken:accessToken configuration:config];
}

RCT_EXPORT_METHOD(setPerson:(NSDictionary *)personInfo) {
  NSString *identifier = personInfo[@"id"] ? [RCTConvert NSString:personInfo[@"id"]] : nil;
  NSString *name = personInfo[@"name"] ? [RCTConvert NSString:personInfo[@"name"]] : nil;
  NSString *email = personInfo[@"email"] ? [RCTConvert NSString:personInfo[@"email"]] : nil;
  [[Rollbar currentConfiguration] setPersonId:identifier username:name email:email];
}

RCT_EXPORT_METHOD(clearPerson) {
  [[Rollbar currentConfiguration] setPersonId:nil username:nil email:nil];
}

@end
