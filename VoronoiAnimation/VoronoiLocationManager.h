//
//  VoronoiLocationManager.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/15/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface VoronoiLocationManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic, strong) CLLocationManager *locationManager;


@end
