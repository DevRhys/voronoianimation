//
//  VoronoiLocationManager.m
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/15/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "VoronoiLocationManager.h"

@implementation VoronoiLocationManager

#pragma mark- Singleton

+ (instancetype)sharedManager {
    static VoronoiLocationManager *_sharedManager = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[VoronoiLocationManager alloc] initPrivate];
    });
    
    return _sharedManager;
}

#pragma mark- Initializers

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
    }
    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[VoronoiLocationManager sharedManager]" userInfo:nil];
    return nil;
}

@end
