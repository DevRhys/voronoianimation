//
//  VoronoiMapViewController.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/15/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "VoronoiMap.h"
#import "VoronoiCellTower.h"
#import "EditMapViewController.h"

@class VoronoiMapViewController;

@interface VoronoiMapViewController : UIViewController <MKMapViewDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) VoronoiMap *vMap;
@property (strong, nonatomic) VoronoiCellTower *currentlySelectedTower;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)done:(UIBarButtonItem *)sender;

@end
