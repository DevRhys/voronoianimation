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

- (instancetype)initWithTitle:(NSString*)title;

- (NSArray *)cellTowers;
- (NSArray *)annotations;
- (NSArray *)allTowerLocations;
- (NSArray *)voronoiCells;

- (BOOL)saveCellTower:(VoronoiCellTower *)cellTower;
- (BOOL)removeTowerByID:(NSUUID *)uuID;

- (NSString *)generateCellTowerTitle;
- (VoronoiCellTower *)getCellTowerByID:(NSUUID *)uuID;
- (void)clearCellTowers;



@end
