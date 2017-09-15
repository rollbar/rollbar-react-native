//
//  Rollbar.h
//  Rollbar
//
//  Created by Sergei Bezborodko on 3/18/14.
//  Copyright (c) 2014 Rollbar, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RollbarConfiguration.h"

@interface Rollbar : NSObject

+ (void)initWithAccessToken:(NSString*)accessToken configuration:(RollbarConfiguration*)configuration
        enableCrashReporter:(BOOL)enable;
+ (void)initWithAccessToken:(NSString*)accessToken;
+ (void)initWithAccessToken:(NSString*)accessToken configuration:(RollbarConfiguration*)configuration;

+ (RollbarConfiguration*)currentConfiguration;

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

@end
