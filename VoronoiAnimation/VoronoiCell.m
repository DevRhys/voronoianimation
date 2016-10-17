//
//  VoronoiCell.m
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "VoronoiCell.h"
#import "Halfedge.h"
#import "Vertex.h"
#import "VMapUtilities.h"
#import "MKPolygon+MKPolygon_BHEExtensions.h"

@implementation VoronoiCell

- (instancetype)initWithCell:(Cell *)cell  {
    
    self = [super init];
    if (self) {
        _cell = cell;
    }
    return self;
}

- (UIColor *)color {
    return self.cell.site.cellTower.voronoiCellColor;
}

- (NSArray *)edges {
    return self.cell.halfedges;
}

- (NSArray *)vertices {
    return [VMapUtilities verticesFromCell:self.cell];
}

- (MKPolygon *)overlay {
    MKPolygon *overlay = [VMapUtilities overlayFromVertices:self.vertices];
    overlay.overlayColor = self.cell.site.cellTower.voronoiCellColor;
    overlay.title = [self.cell.site.cellTower.uuID UUIDString];
    return overlay;
}

@end
