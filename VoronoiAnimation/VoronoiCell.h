//
//  VoronoiCell.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "VoronoiCellTower.h"

@interface VoronoiCell : NSObject

@property (nonatomic, strong) Cell *cell;
@property (nonatomic, strong) VoronoiCellTower *tower;
@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithCell:(Cell *)cell tower:(VoronoiCellTower *)tower;

- (NSArray *)edges;
- (NSArray *)vertices;
- (MKPolygon *)overlay;

@end