//
//  VoronoiCellTowerAnnotation.m
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "VoronoiCellTowerAnnotation.h"

@implementation VoronoiCellTowerAnnotation

@synthesize coordinate;

- (instancetype)initWithLocation:(CLLocationCoordinate2D)coord {
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;
}

- (instancetype)initWithTower:(VoronoiCellTower *)cellTower {
    self = [super init];
    if (self) {
        _cellTowerID = cellTower.uuID;
        coordinate = cellTower.location.coordinate;
        _title = cellTower.title;
    }
    return self;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newLocation {
    coordinate = newLocation;
}
@end
