//
//  EditMapViewController.m
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "EditMapViewController.h"
#import "VoronoiMapStore.h"

@implementation EditMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.titleField.text = [[VoronoiMapStore sharedStore] generateVoronoiMapTitle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self.delegate editMapDidCancel:self];
}

- (IBAction)save:(UIBarButtonItem *)sender {
    [self.delegate editMapDidSave:self];
}
@end
