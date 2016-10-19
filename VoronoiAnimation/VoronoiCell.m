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


- (instancetype)initWithCell:(Cell *)cell tower:(VoronoiCellTower *)tower {
    self = [super init];
    if (self) {
        _cell = cell;
        _tower = tower;
        _color = tower.color;
    }
    return self;
}

- (NSArray *)edges {
    return self.cell.halfedges;
}

- (NSArray *)vertices {
    return [VMapUtilities verticesFromCell:self.cell];
}

- (MKPolygon *)overlay {
    MKPolygon *overlay = [VMapUtilities overlayFromVertices:self.vertices];
    overlay.overlayColor = self.color;
    return overlay;
}

@end
