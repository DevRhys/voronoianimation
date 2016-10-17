//
//  VoronoiCellTower.m
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "VoronoiCellTower.h"
#import "VMapUtilities.h"

@implementation VoronoiCellTower

// Designated Initializer
- (instancetype)initWithLocation:(CLLocation *)location name:(NSString *)title {
    self = [super init];
    if (self) {
        _title = title;
        _location = location;
        _uuID = [NSUUID UUID];
        _voronoiCellColor = [[VMapUtilities randomColor] colorWithAlphaComponent:0.4];
    }
    return self;
}

- (instancetype)initWithLocation:(CLLocation *)location {
    return [self initWithLocation:location name:kBaseCellTowerTitle];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.location = [aDecoder decodeObjectForKey:@"location"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.uuID = [aDecoder decodeObjectForKey:@"uuID"];
        _voronoiCellColor = [aDecoder decodeObjectForKey:@"voronoiCellColor"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.location forKey:@"location"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.uuID forKey:@"uuID"];
    [aCoder encodeObject:self.voronoiCellColor forKey:@"voronoiCellColor"];
}

- (CLLocationDistance)distanceFromCellTower:(VoronoiCellTower *)tower {
    if (self.location) {
        return [self.location distanceFromLocation:tower.location];
    }
    return -1;
}

- (CLLocationDistance)distanceFromLocation:(CLLocation *)location {
    if (self.location) {
        return [self.location distanceFromLocation:location];
    }
    return -1;
}

- (NSString *)description {
    NSString *description = [NSString stringWithFormat:@"%@ (%@): LAT: %f, LONG: %f", self.title, self.uuID.UUIDString, self.location.coordinate.latitude, self.location.coordinate.longitude];
    return description;
}

@end
