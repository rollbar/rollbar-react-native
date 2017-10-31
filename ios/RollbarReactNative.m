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
