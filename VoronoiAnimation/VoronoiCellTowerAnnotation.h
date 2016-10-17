//
//  VoronoiCellTowerAnnotation.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "VoronoiCellTower.h"

@interface VoronoiCellTowerAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSUUID *cellTowerID;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithLocation:(CLLocationCoordinate2D)coord;
- (instancetype)initWithTower:(VoronoiCellTower *)cellTower;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
@end
