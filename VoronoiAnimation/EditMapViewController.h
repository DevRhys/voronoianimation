//
//  EditMapViewController.h
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoronoiMap.h"

@class EditMapViewController;

@protocol EditMapViewControllerDelegate <NSObject>
@optional
    @property (nonatomic, strong) VoronoiMap *voronoiMap;
@required
    - (void)editMapDidSave:(EditMapViewController *)mapDetails;
    - (void)editMapDidCancel:(EditMapViewController *)mapDetails;
@end

@interface EditMapViewController : UIViewController
@property (nonatomic, weak) id<EditMapViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)save:(UIBarButtonItem *)sender;
@end
