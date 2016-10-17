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

@interface VoronoiCell : NSObject

@property (nonatomic, strong) Cell *cell;

- (instancetype)initWithCell:(Cell *)cell;
- (UIColor *)color;
- (NSArray *)edges;
- (NSArray *)vertices;
- (MKPolygon *)overlay;

@end