//
//  VoronoiCellTower.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/18/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "Site.h"
#import <MapKit/MapKit.h>
#import "VMapConstants.h"

@interface VoronoiCellTower : Site

@property (nonatomic, strong) CLLocation *location;
@property (copy, nonatomic) NSString *title;
@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithLocation:(CLLocation *)location;
- (instancetype)initWithLocation:(CLLocation *)location name:(NSString *)title;
- (CLLocationDistance)distanceFromCellTower:(VoronoiCellTower *)cellTower;
- (CLLocationDistance)distanceFromLocation:(CLLocation *)location;

@end
