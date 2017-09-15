//
//  RollbarConfiguration.h
//  Rollbar
//
//  Created by Sergei Bezborodko on 3/21/14.
//  Copyright (c) 2014 Rollbar, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RollbarConfiguration : NSObject {
    // Stores whether this configuration is the root level
    // configuration used by the root level notifier
    BOOL isRootConfiguration;
}

+ (RollbarConfiguration*)configuration;

- (id)initWithLoadedConfiguration;

- (void)_setRoot;
- (void)save;

- (void)setPersonId:(NSString*)personId username:(NSString*)username email:(NSString*)email;

- (NSDictionary *)customData;

@property (atomic, copy) NSString *accessToken;
@property (atomic, copy) NSString *environment;
@property (atomic, copy) NSString *endpoint;
@property (atomic, copy) NSString *crashLevel;
@property (readonly, atomic, copy) NSString *personId;
@property (readonly, atomic, copy) NSString *personUsername;
@property (readonly, atomic, copy) NSString *personEmail;

@end
