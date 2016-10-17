//
//  VoronoiCellTower.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "VMapConstants.h"

@interface VoronoiCellTower : NSObject

@property (nonatomic, strong) CLLocation *location;
@property (copy, nonatomic) NSString *title;
@property (nonatomic, strong) NSUUID *uuID;
@property (nonatomic, strong) UIColor *voronoiCellColor;

- (instancetype)initWithLocation:(CLLocation *)location;
- (instancetype)initWithLocation:(CLLocation *)location name:(NSString *)title;
- (CLLocationDistance)distanceFromCellTower:(VoronoiCellTower *)beacon;
- (CLLocationDistance)distanceFromLocation:(CLLocation *)location;

@end
