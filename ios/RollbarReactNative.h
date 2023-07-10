#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif

@interface RollbarReactNative : NSObject <RCTBridgeModule>

+ (void)initWithConfiguration:(nonnull NSDictionary *)configuration;

+ (void)log:(nonnull NSString*)level message:(nonnull NSString*)message;
+ (void)log:(nonnull NSString*)level exception:(nonnull NSException*)exception;
+ (void)log:(nonnull NSString*)level error:(nonnull NSError*)error;

+ (void)log:(nonnull NSString*)level
    message:(nonnull NSString*)message
       data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)log:(nonnull NSString*)level
    exception:(nonnull NSException*)exception
         data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)log:(nonnull NSString*)level
      error:(nonnull NSError*)error
       data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)log:(nonnull NSString*)level
    message:(nonnull NSString*)message
       data:(nullable NSDictionary<NSString *, id> *)data
    context:(nullable NSString *)context;

+ (void)log:(nonnull NSString*)level
    exception:(nonnull NSException*)exception
         data:(nullable NSDictionary<NSString *, id> *)data
      context:(nullable NSString *)context;

+ (void)log:(nonnull NSString*)level
      error:(nonnull NSError*)error
       data:(nullable NSDictionary<NSString *, id> *)data
    context:(nullable NSString *)context;

+ (void)debugMessage:(nonnull NSString*)message;
+ (void)debugException:(nonnull NSException*)exception;
+ (void)debugError:(nonnull NSError*)error;

+ (void)debugMessage:(nonnull NSString*)message
                data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)debugException:(nonnull NSException*)exception
                  data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)debugError:(nonnull NSError*)error
              data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)debugMessage:(nonnull NSString*)message
                data:(nullable NSDictionary<NSString *, id> *)data
             context:(nullable NSString *)context;

+ (void)debugException:(nonnull NSException*)exception
                  data:(nullable NSDictionary<NSString *, id> *)data
               context:(nullable NSString *)context;

+ (void)debugError:(nonnull NSError*)error
              data:(nullable NSDictionary<NSString *, id> *)data
           context:(nullable NSString *)context;

+ (void)infoMessage:(nonnull NSString*)message;
+ (void)infoException:(nonnull NSException*)exception;
+ (void)infoError:(nonnull NSError*)error;

+ (void)infoMessage:(nonnull NSString*)message
               data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)infoException:(nonnull NSException*)exception
                 data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)infoError:(nonnull NSError*)error
             data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)infoMessage:(nonnull NSString*)message
               data:(nullable NSDictionary<NSString *, id> *)data
            context:(nullable NSString *)context;

+ (void)infoException:(nonnull NSException*)exception
                 data:(nullable NSDictionary<NSString *, id> *)data
              context:(nullable NSString *)context;

+ (void)infoError:(nonnull NSError*)error
             data:(nullable NSDictionary<NSString *, id> *)data
          context:(nullable NSString *)context;

+ (void)warningMessage:(nonnull NSString*)message;
+ (void)warningException:(nonnull NSException*)exception;
+ (void)warningError:(nonnull NSError*)error;

+ (void)warningMessage:(nonnull NSString*)message
                  data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)warningException:(nonnull NSException*)exception
                    data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)warningError:(nonnull NSError*)error
                data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)warningMessage:(nonnull NSString*)message
                  data:(nullable NSDictionary<NSString *, id> *)data
               context:(nullable NSString *)context;

+ (void)warningException:(nonnull NSException*)exception
                    data:(nullable NSDictionary<NSString *, id> *)data
                 context:(nullable NSString *)context;

+ (void)warningError:(nonnull NSError*)error
                data:(nullable NSDictionary<NSString *, id> *)data
             context:(nullable NSString *)context;

+ (void)errorMessage:(nonnull NSString*)message;
+ (void)errorException:(nonnull NSException*)exception;
+ (void)errorError:(nonnull NSError*)error;

+ (void)errorMessage:(nonnull NSString*)message
                data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)errorException:(nonnull NSException*)exception
                  data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)errorError:(nonnull NSError*)error
              data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)errorMessage:(nonnull NSString*)message
                data:(nullable NSDictionary<NSString *, id> *)data
             context:(nullable NSString *)context;

+ (void)errorException:(nonnull NSException*)exception
                  data:(nullable NSDictionary<NSString *, id> *)data
               context:(nullable NSString *)context;

+ (void)errorError:(nonnull NSError*)error
              data:(nullable NSDictionary<NSString *, id> *)data
           context:(nullable NSString *)context;

+ (void)criticalMessage:(nonnull NSString*)message;
+ (void)criticalException:(nonnull NSException*)exception;
+ (void)criticalError:(nonnull NSError*)error;

+ (void)criticalMessage:(nonnull NSString*)message
                   data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)criticalException:(nonnull NSException*)exception
                     data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)criticalError:(nonnull NSError*)error
                 data:(nullable NSDictionary<NSString *, id> *)data;

+ (void)criticalMessage:(nonnull NSString*)message
                   data:(nullable NSDictionary<NSString *, id> *)data
                context:(nullable NSString *)context;

+ (void)criticalException:(nonnull NSException*)exception
                     data:(nullable NSDictionary<NSString *, id> *)data
                  context:(nullable NSString *)context;

+ (void)criticalError:(nonnull NSError*)error
                 data:(nullable NSDictionary<NSString *, id> *)data
              context:(nullable NSString *)context;

- (void)init:(nonnull NSDictionary *)options;
- (void)setPerson:(nonnull NSDictionary *)personInfo;
- (void)clearPerson;

@end
