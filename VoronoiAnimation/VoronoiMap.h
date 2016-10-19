//
//  VoronoiMap.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "VoronoiCellTower.h"

@interface VoronoiMap : NSObject

@property (nonatomic, strong) NSUUID *uuID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableDictionary *cellTowers;

+ (NSArray *)voronoiCellsFromTowers:(NSMutableDictionary *)cellTowers;

- (instancetype)initWithTitle:(NSString*)title;

- (NSArray *)annotations;
- (NSArray *)allTowerLocations;
- (NSArray *)voronoiCells;

- (NSString *)generateCellTowerTitle;

@end
