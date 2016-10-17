//
//  NSObject+MKPolygon_MKPolygon_BHEExtensions.m
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "MKPolygon+MKPolygon_BHEExtensions.h"
#import <objc/runtime.h>

@implementation MKPolygon (MKPolygon_BHEExtensions)

static char overlayColorKey;

- (void)setOverlayColor:(UIColor *)overlayColor {
    objc_setAssociatedObject(self, &overlayColorKey, overlayColor, OBJC_ASSOCIATION_RETAIN );
}

- (UIColor*)overlayColor {
    return objc_getAssociatedObject( self, &overlayColorKey );
}

@end
