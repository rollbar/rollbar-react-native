#import "RollbarReactNative.h"
#import <React/RCTConvert.h>
#import <Rollbar/Rollbar.h>

@implementation RollbarReactNative

+ (void)start {

}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(start:(NSDictionary *)options) {
  RollbarConfiguration *config = [RollbarConfiguration configuration];
  [Rollbar initWithAccessToken:@"POST_CLIENT_ITEM_ACCESS_TOKEN" configuration:config];
  
}

RCT_EXPORT_METHOD(setUser:(NSDictionary *)userInfo) {
  NSString *identifier = userInfo[@"id"] ? [RCTConvert NSString:userInfo[@"id"]] : nil;
  NSString *name = userInfo[@"name"] ? [RCTConvert NSString:userInfo[@"name"]] : nil;
  NSString *email = userInfo[@"email"] ? [RCTConvert NSString:userInfo[@"email"]] : nil;
  [[Rollbar currentConfiguration] setPersonId:identifier username:name email:email];
}

RCT_EXPORT_METHOD(clearUser) {
  [[Rollbar currentConfiguration] setPersonId:nil username:nil email:nil];
}

@end
