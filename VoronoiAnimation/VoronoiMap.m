//
//  VoronoiMap.m
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "VoronoiMap.h"
#import "VoronoiCellTower.h"
#import "VoronoiCellTowerAnnotation.h"
#import "Voronoi.h"
#import "VoronoiResult.h"
#import "Cell.h"
#import "VoronoiCell.h"

@interface VoronoiMap ()
@property (nonatomic, strong) NSMutableDictionary *privateCellTowers;
@end

@implementation VoronoiMap

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _uuID = [NSUUID UUID];
        _title = title;
        _privateCellTowers = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _title = [aDecoder decodeObjectForKey:@"title"];
        _uuID = [aDecoder decodeObjectForKey:@"uuID"];
        _privateCellTowers = [aDecoder decodeObjectForKey:@"privateCellTowers"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.uuID forKey:@"uuID"];
    [aCoder encodeObject:self.privateCellTowers forKey:@"privateCellTowers"];
}

- (NSArray *)cellTowers {
    return [_privateCellTowers allValues];
}

- (VoronoiCellTower *)getCellTowerByID:(NSUUID *)uuID {
    return [self.privateCellTowers objectForKey:uuID];
}

- (BOOL)saveCellTower:(VoronoiCellTower *)cellTower {
    [self.privateCellTowers setObject:cellTower forKey:cellTower.uuID];
    return TRUE;
}

- (BOOL)removeTowerByID:(NSUUID *)uuID {
    [self.privateCellTowers removeObjectForKey:uuID];
    return TRUE;
}

- (void)clearCellTowers {
    [self.privateCellTowers removeAllObjects];
}

- (NSArray *)allTowerLocations {
    NSMutableArray *coordinates = [NSMutableArray array];
    for (VoronoiCellTower *cellTower in self.cellTowers) {
        [coordinates addObject:cellTower.location];
    }
    
    //fix me
    return coordinates;
}

- (NSArray *)annotations {
    NSMutableArray *annotationsArray = [NSMutableArray array];
    
    for (VoronoiCellTower *cellTower in self.cellTowers) {
        VoronoiCellTowerAnnotation *annotation = [[VoronoiCellTowerAnnotation alloc] initWithTower:cellTower];
        [annotationsArray addObject:annotation];
    }
    return annotationsArray;
}

- (NSString *)generateCellTowerTitle {
    NSString *baseTitle = kBaseCellTowerTitle;
    NSString *title = baseTitle;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title = %@", title];
    NSArray *results = [self.cellTowers filteredArrayUsingPredicate:predicate];
    int suffix = 2;
    
    while ([results count]) {
        title = [baseTitle stringByAppendingString: [NSString stringWithFormat:@" %d", suffix]];
        predicate = [NSPredicate predicateWithFormat:@"title = %@", title];
        results = [self.cellTowers filteredArrayUsingPredicate:predicate];
        suffix++;
    }
    return title;
}

- (NSArray *)voronoiCells {
    
    NSMutableArray *voronoiCells = [NSMutableArray array];
    
    // Voronoi Tesselation
    Voronoi *voronoi = [[Voronoi alloc] init];
    VoronoiResult *result = [voronoi computeWithSites:[self.cellTowers mutableCopy] andBoundingBox:CGRectMake(0, 0, kMaximumMapPointX, kMaximumMapPointY)];
    
    for (Cell *cell in result.cells) {
        [voronoiCells addObject:[[VoronoiCell alloc] initWithCell:cell]];
    }
    
    return voronoiCells;
}

@end
