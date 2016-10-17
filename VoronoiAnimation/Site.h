//
//  Site.h
//  objcvoronoi
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VoronoiCellTower.h"

@interface Site : NSObject {
    CGPoint coord;
    int voronoiId;
    VoronoiCellTower *cellTower;
}

@property (assign, readwrite) int voronoiId;

- (id)initWithCoord:(CGPoint)tempCoord;
- (id)initWithValue:(NSValue *)valueWithCoord;
- (id)initWithCellTower:(VoronoiCellTower *)initCell;

- (void)setCoord:(CGPoint)tempCoord;
- (CGPoint)coord;

- (void)setCoordAsValue:(NSValue *)valueWithCoord;
- (NSValue *)coordAsValue;

- (void)setBeacon:(VoronoiCellTower *)tempTower;
- (VoronoiCellTower *)cellTower;

- (void)setX:(double)tempX;
- (double)x;

- (void)setY:(double)tempY;
- (double)y;

+ (void)sortSites:(NSMutableArray *)siteArray;
- (NSComparisonResult)compare:(Site *)s;

@end
