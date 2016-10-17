//
//  VMapUtilities.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/15/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Cell.h"

@interface VMapUtilities : NSObject

+ (NSArray *)verticesFromCell:(Cell *)cell;
+ (MKPolygon *)overlayFromVertices:(NSArray *)vertices;
+ (UIColor*)randomColor;

@end