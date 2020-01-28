#import "RollbarReactNative.h"
#if __has_include(<React/RCTConvert.h>)
#import <React/RCTConvert.h>
#else
#import "RCTConvert.h"
#endif
#include <sys/utsname.h>

@implementation RollbarReactNative

static NSString *const NOTIFIER_NAME = @"rollbar-react-native";
static NSString *const NOTIFIER_VERSION = @"0.7.1";
static NSString *const REACT_NATIVE = @"react-native";

+ (void)initWithAccessToken:(NSString *)accessToken {
  [RollbarReactNative initWithAccessToken:accessToken configuration:nil];
}

+ (void)initWithAccessToken:(NSString *)accessToken configuration:(RollbarConfiguration *)config {
  [RollbarReactNative initWithAccessToken:accessToken configuration:config enableCrashReporter:YES];
}

+ (void)initWithAccessToken:(NSString *)accessToken configuration:(RollbarConfiguration*)configuration enableCrashReporter:(BOOL)enable {
  [Rollbar initWithAccessToken:accessToken configuration:configuration enableCrashReporter:enable];
}

+ (void)logWithLevel:(NSString*)level message:(NSString*)message {
  [Rollbar logWithLevel:level message:message];
}

+ (void)logWithLevel:(NSString*)level message:(NSString*)message data:(NSDictionary*)data {
  [Rollbar logWithLevel:level message:message data:data];
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

// New interface

+ (void)log:(RollbarLevel)level message:(NSString*)message {
  [Rollbar log:level message:message];
}

+ (void)log:(RollbarLevel)level message:(NSString*)message exception:(NSException*)exception {
  [Rollbar log:level message:message exception:exception];
}

+ (void)log:(RollbarLevel)level message:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data {
  [Rollbar log:level message:message exception:exception data:data];
}

+ (void)log:(RollbarLevel)level message:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context {
  [Rollbar log:level message:message exception:exception data:data context:context];
}

+ (void)debug:(NSString*)message {
  [Rollbar debug:message];
}

+ (void)debug:(NSString*)message exception:(NSException*)exception {
  [Rollbar debug:message exception:exception];
}

+ (void)debug:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data {
  [Rollbar debug:message exception:exception data:data];
}

+ (void)debug:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context {
  [Rollbar debug:message exception:exception data:data context:context];
}

+ (void)info:(NSString*)message {
  [Rollbar info:message];
}

+ (void)info:(NSString*)message exception:(NSException*)exception {
  [Rollbar info:message exception:exception];
}

+ (void)info:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data {
  [Rollbar info:message exception:exception data:data];
}

+ (void)info:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context {
  [Rollbar info:message exception:exception data:data context:context];
}

+ (void)warning:(NSString*)message {
  [Rollbar warning:message];
}

+ (void)warning:(NSString*)message exception:(NSException*)exception {
  [Rollbar warning:message exception:exception];
}

+ (void)warning:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data {
  [Rollbar warning:message exception:exception data:data];
}

+ (void)warning:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context {
  [Rollbar warning:message exception:exception data:data context:context];
}

+ (void)error:(NSString*)message {
  [Rollbar error:message];
}

+ (void)error:(NSString*)message exception:(NSException*)exception {
  [Rollbar error:message exception:exception];
}

+ (void)error:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data {
  [Rollbar error:message exception:exception data:data];
}

+ (void)error:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context {
  [Rollbar error:message exception:exception data:data context:context];
}

+ (void)critical:(NSString*)message {
  [Rollbar critical:message];
}

+ (void)critical:(NSString*)message exception:(NSException*)exception {
  [Rollbar critical:message exception:exception];
}

+ (void)critical:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data {
  [Rollbar critical:message exception:exception data:data];
}

+ (void)critical:(NSString*)message exception:(NSException*)exception data:(NSDictionary*)data context:(NSString*)context {
  [Rollbar critical:message exception:exception data:data context:context];
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
    config.crashLevel = [RCTConvert NSString:options[@"logLevel"]];
  }
  if (options[@"notifier"]) {
    NSDictionary *notifierConfig = [RCTConvert NSDictionary:options[@"notifier"]];
    NSString *name = notifierConfig[@"name"] ?: NOTIFIER_NAME;
    NSString *version = notifierConfig[@"version"] ?: NOTIFIER_VERSION;
    [config setNotifierName:name version:version];
  }
  NSString *framework = REACT_NATIVE;
  if (options[@"framework"]) {
    framework = [RCTConvert NSString:options[@"framework"]];
  }
  [config setCodeFramework:framework];

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

  id enabledJSON = [options objectForKey:@"enabled"];
  BOOL enabled = YES;
  if (enabledJSON != nil) {
    enabled = [RCTConvert BOOL:enabledJSON];
  }

  [Rollbar initWithAccessToken:accessToken configuration:config enableCrashReporter:enabled];
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

// Defined as synchronous because the data must be returned in the
// javascript configuration constructor before Rollbar.js is initialized.
RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(deviceAttributes)
{
  struct utsname systemInfo;
  uname(&systemInfo);
  NSString *deviceCode = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

  NSBundle *mainBundle = [NSBundle mainBundle];
  NSString *version = [mainBundle objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey];
  NSString *shortVersion = [mainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  NSString *bundleName = [mainBundle objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
  NSString *bundleIdentifier = [mainBundle objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey];

  NSDictionary *attributes = @{
    @"os": @"ios",
    @"os_version": [[UIDevice currentDevice] systemVersion],
    @"system_name": [[UIDevice currentDevice] systemName],
    @"device_name": [[UIDevice currentDevice] name],
    @"device_code" : deviceCode,
    @"code_version": version ? version : @"",
    @"short_version": shortVersion ? shortVersion : @"",
    @"bundle_identifier": bundleIdentifier ? bundleIdentifier : @"",
    @"app_name": bundleName ? bundleName : @""
  };

  NSError *error;
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:attributes
                                                     options:0
                                                       error:&error];

  NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

  return jsonString;
}

@end
