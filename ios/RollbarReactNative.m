#import "RollbarReactNative.h"
#if __has_include(<React/RCTConvert.h>)
#import <React/RCTConvert.h>
#else
#import "RCTConvert.h"
#endif
#include <sys/utsname.h>

#if __has_include(<RollbarNotifier/Rollbar.h>)
#import <RollbarNotifier/Rollbar.h>
#else
#import "Rollbar.h"
#endif

@implementation RollbarReactNative

static NSString *const NOTIFIER_NAME = @"rollbar-react-native";
static NSString *const NOTIFIER_VERSION = @"1.0.0";
static NSString *const REACT_NATIVE = @"react-native";

+ (void)initWithConfiguration:(NSDictionary*)options {
  RollbarMutableConfig *config = [[Rollbar configuration] mutableCopy];
  if (config) {
    updateConfiguration(config, options);
    [Rollbar updateWithConfiguration:config];
    return;
  }
  config = [RollbarConfig mutableConfigWithAccessToken:[RCTConvert NSString:options[@"accessToken"]]];
  updateConfiguration(config, options);

  [Rollbar initWithConfiguration:config];
}

+ (void)log:(nonnull NSString*)level message:(NSString*)message {
  RollbarLevel rLevel = rollbarLevelFromString(level);
  [Rollbar log:rLevel message:message];
}

+ (void)log:(nonnull NSString*)level exception:(NSException*)exception {
  RollbarLevel rLevel = rollbarLevelFromString(level);
  [Rollbar log:rLevel exception:exception];
}

+ (void)log:(nonnull NSString*)level error:(NSError*)error {
  RollbarLevel rLevel = rollbarLevelFromString(level);
  [Rollbar log:rLevel error:error];
}

+ (void)log:(nonnull NSString*)level
    message:(NSString*)message
       data:(nullable NSDictionary<NSString *, id> *)data {
  RollbarLevel rLevel = rollbarLevelFromString(level);
  [Rollbar log:rLevel message:message data:data];
}

+ (void)log:(nonnull NSString*)level
    exception:(NSException*)exception
         data:(nullable NSDictionary<NSString *, id> *)data {
  RollbarLevel rLevel = rollbarLevelFromString(level);
  [Rollbar log:rLevel exception:exception data:data];
}

+ (void)log:(nonnull NSString*)level
      error:(NSError*)error
       data:(nullable NSDictionary<NSString *, id> *)data {
  RollbarLevel rLevel = rollbarLevelFromString(level);
  [Rollbar log:rLevel error:error data:data];
}

+ (void)log:(nonnull NSString*)level
    message:(NSString*)message
       data:(nullable NSDictionary<NSString *, id> *)data
    context:(nullable NSString *)context {
  RollbarLevel rLevel = rollbarLevelFromString(level);
  [Rollbar log:rLevel message:message data:data context:context];
}

+ (void)log:(nonnull NSString*)level
    exception:(NSException*)exception
         data:(nullable NSDictionary<NSString *, id> *)data
      context:(nullable NSString *)context {
  RollbarLevel rLevel = rollbarLevelFromString(level);
  [Rollbar log:rLevel exception:exception data:data context:context];
}

+ (void)log:(nonnull NSString*)level
      error:(NSError*)error
       data:(nullable NSDictionary<NSString *, id> *)data
    context:(nullable NSString *)context {
  RollbarLevel rLevel = rollbarLevelFromString(level);
  [Rollbar log:rLevel error:error data:data context:context];
}

+ (void)debugMessage:(NSString*)message {
  [Rollbar debugMessage:message];
}

+ (void)debugException:(NSException*)exception {
  [Rollbar debugException:exception];
}

+ (void)debugError:(NSError*)error {
  [Rollbar debugError:error];
}

+ (void)debugMessage:(NSString*)message
                data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar debugMessage:message data:data];
}

+ (void)debugException:(NSException*)exception
                  data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar debugException:exception data:data];
}

+ (void)debugError:(NSError*)error
              data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar debugError:error data:data];
}

+ (void)debugMessage:(NSString*)message
                data:(nullable NSDictionary<NSString *, id> *)data
             context:(nullable NSString *)context {
  [Rollbar debugMessage:message data:data context:context];
}

+ (void)debugException:(NSException*)exception
                  data:(nullable NSDictionary<NSString *, id> *)data
               context:(nullable NSString *)context {
  [Rollbar debugException:exception data:data context:context];
}

+ (void)debugError:(NSError*)error
              data:(nullable NSDictionary<NSString *, id> *)data
           context:(nullable NSString *)context {
  [Rollbar debugError:error data:data context:context];
}

+ (void)infoMessage:(NSString*)message {
  [Rollbar infoMessage:message];
}

+ (void)infoException:(NSException*)exception {
  [Rollbar infoException:exception];
}

+ (void)infoError:(NSError*)error {
  [Rollbar infoError:error];
}

+ (void)infoMessage:(NSString*)message
               data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar infoMessage:message data:data];
}

+ (void)infoException:(NSException*)exception
                 data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar infoException:exception data:data];
}

+ (void)infoError:(NSError*)error
             data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar infoError:error data:data];
}

+ (void)infoMessage:(NSString*)message
               data:(nullable NSDictionary<NSString *, id> *)data
            context:(nullable NSString *)context {
  [Rollbar infoMessage:message data:data context:context];
}

+ (void)infoException:(NSException*)exception
                 data:(nullable NSDictionary<NSString *, id> *)data
              context:(nullable NSString *)context {
  [Rollbar infoException:exception data:data context:context];
}

+ (void)infoError:(NSError*)error
             data:(nullable NSDictionary<NSString *, id> *)data
          context:(nullable NSString *)context {
  [Rollbar infoError:error data:data context:context];
}

+ (void)warningMessage:(NSString*)message {
  [Rollbar warningMessage:message];
}

+ (void)warningException:(NSException*)exception {
  [Rollbar warningException:exception];
}

+ (void)warningError:(NSError*)error {
  [Rollbar warningError:error];
}

+ (void)warningMessage:(NSString*)message
                  data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar warningMessage:message data:data];
}

+ (void)warningException:(NSException*)exception
                    data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar warningException:exception data:data];
}

+ (void)warningError:(NSError*)error
                data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar warningError:error data:data];
}

+ (void)warningMessage:(NSString*)message
                  data:(nullable NSDictionary<NSString *, id> *)data
               context:(nullable NSString *)context {
  [Rollbar warningMessage:message data:data context:context];
}

+ (void)warningException:(NSException*)exception
                    data:(nullable NSDictionary<NSString *, id> *)data
                 context:(nullable NSString *)context {
  [Rollbar warningException:exception data:data context:context];
}

+ (void)warningError:(NSError*)error
                data:(nullable NSDictionary<NSString *, id> *)data
             context:(nullable NSString *)context {
  [Rollbar warningError:error data:data context:context];
}

+ (void)errorMessage:(NSString*)message {
  [Rollbar errorMessage:message];
}

+ (void)errorException:(NSException*)exception {
  [Rollbar errorException:exception];
}

+ (void)errorError:(NSError*)error {
  [Rollbar errorError:error];
}

+ (void)errorMessage:(NSString*)message
                data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar errorMessage:message data:data];
}

+ (void)errorException:(NSException*)exception
                  data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar errorException:exception data:data];
}

+ (void)errorError:(NSError*)error
              data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar errorError:error data:data];
}

+ (void)errorMessage:(NSString*)message
                data:(nullable NSDictionary<NSString *, id> *)data
             context:(nullable NSString *)context {
  [Rollbar errorMessage:message data:data context:context];
}

+ (void)errorException:(NSException*)exception
                  data:(nullable NSDictionary<NSString *, id> *)data
               context:(nullable NSString *)context {
  [Rollbar errorException:exception data:data context:context];
}

+ (void)errorError:(NSError*)error
              data:(nullable NSDictionary<NSString *, id> *)data
           context:(nullable NSString *)context {
  [Rollbar errorError:error data:data context:context];
}

+ (void)criticalMessage:(NSString*)message {
  [Rollbar criticalMessage:message];
}

+ (void)criticalException:(NSException*)exception {
  [Rollbar criticalException:exception];
}

+ (void)criticalError:(NSError*)error {
  [Rollbar criticalError:error];
}

+ (void)criticalMessage:(NSString*)message
                   data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar criticalMessage:message data:data];
}

+ (void)criticalException:(NSException*)exception
                     data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar criticalException:exception data:data];
}

+ (void)criticalError:(NSError*)error
                 data:(nullable NSDictionary<NSString *, id> *)data {
  [Rollbar criticalError:error data:data];
}

+ (void)criticalMessage:(NSString*)message
                   data:(nullable NSDictionary<NSString *, id> *)data
                context:(nullable NSString *)context {
  [Rollbar criticalMessage:message data:data context:context];
}

+ (void)criticalException:(NSException*)exception
                     data:(nullable NSDictionary<NSString *, id> *)data
                  context:(nullable NSString *)context {
  [Rollbar criticalException:exception data:data context:context];
}

+ (void)criticalError:(NSError*)error
                 data:(nullable NSDictionary<NSString *, id> *)data
              context:(nullable NSString *)context {
  [Rollbar criticalError:error data:data context:context];
}

RollbarLevel rollbarLevelFromString(NSString *value) {
    if (value == nil) {
        return RollbarLevel_Info;
    } else if ([value caseInsensitiveCompare:@"debug"] == NSOrderedSame) {
        return RollbarLevel_Debug;
    } else if ([value caseInsensitiveCompare:@"info"] == NSOrderedSame) {
        return RollbarLevel_Info;
    } else if ([value caseInsensitiveCompare:@"warning"] == NSOrderedSame) {
        return RollbarLevel_Warning;
    } else if ([value caseInsensitiveCompare:@"error"] == NSOrderedSame) {
        return RollbarLevel_Error;
    } else if ([value caseInsensitiveCompare:@"critical"] == NSOrderedSame) {
        return RollbarLevel_Critical;
    } else {
        return RollbarLevel_Info;
    }
}

void updateConfiguration(RollbarMutableConfig *config, NSDictionary *options) {
  if (options[@"accessToken"]) {
    config.destination.accessToken = [RCTConvert NSString:options[@"accessToken"]];
  }
  if (options[@"environment"]) {
    config.destination.environment = [RCTConvert NSString:options[@"environment"]];
  }
  if (options[@"endpoint"]) {
    config.destination.endpoint = [RCTConvert NSString:options[@"endpoint"]];
  }
  if (options[@"enabled"]) {
    id enabledJSON = [options objectForKey:@"enabled"];
    BOOL enabled = YES;
    if (enabledJSON != nil) {
      enabled = [RCTConvert BOOL:enabledJSON];
    }
    config.developerOptions.enabled = enabled;
  }
  if (options[@"crashLevel"]) {
    config.loggingOptions.crashLevel = rollbarLevelFromString([RCTConvert NSString:options[@"crashLevel"]]);
  }
  if (options[@"logLevel"]) {
    config.loggingOptions.logLevel = rollbarLevelFromString([RCTConvert NSString:options[@"logLevel"]]);
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
  config.loggingOptions.framework = framework;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(init:(NSDictionary *)options) {
  RollbarMutableConfig *config = [[Rollbar configuration] mutableCopy];
  if (config) {
    updateConfiguration(config, options);
      [Rollbar updateWithConfiguration:config];
    return;
  }
  config = [RollbarConfig mutableConfigWithAccessToken:[RCTConvert NSString:options[@"accessToken"]]];
  updateConfiguration(config, options);

  [Rollbar initWithConfiguration:config];
}

RCT_EXPORT_METHOD(setPerson:(NSDictionary *)personInfo) {
  NSString *identifier = personInfo[@"id"] && ![personInfo[@"id"] isEqual:[NSNull null]]
    ? [RCTConvert NSString:personInfo[@"id"]] : @"";
  NSString *name = personInfo[@"name"] && ![personInfo[@"name"] isEqual:[NSNull null]]
    ? [RCTConvert NSString:personInfo[@"name"]] : nil;
  NSString *email = personInfo[@"email"] && ![personInfo[@"email"] isEqual:[NSNull null]]
    ? [RCTConvert NSString:personInfo[@"email"]] : nil;
  RollbarMutableConfig *config = [[Rollbar configuration] mutableCopy];
  [config setPersonId:identifier username:name email:email];
  [Rollbar updateWithConfiguration:config];
}

RCT_EXPORT_METHOD(clearPerson) {
  RollbarMutableConfig *config = [[Rollbar configuration] mutableCopy];
  [config setPersonId:@"" username:nil email:nil];
  [Rollbar updateWithConfiguration:config];
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
