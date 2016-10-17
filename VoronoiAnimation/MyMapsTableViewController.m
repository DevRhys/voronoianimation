//
//  VoronoiMapTableViewController.m
//  VoronoiAnimation
//
//  Created by Rhys Jones on 10/14/16.
//  Copyright © 2016 Blue House Enterprises. All rights reserved.
//

#import "MyMapsTableViewController.h"
#import "VoronoiMapStore.h"
#import "AppDelegate.h"
#import "VMapConstants.h"
#import "EditMapViewController.h"
#import "VoronoiMapViewController.h"

@interface MyMapsTableViewController ()

@property (nonatomic, strong) VoronoiMap *selectedMap;

@end

@implementation MyMapsTableViewController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[VoronoiMapStore sharedStore] allVoronoiMaps] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MapCell"];
    // Configure the cell...
    NSArray *voronoiMaps = [[VoronoiMapStore sharedStore] allVoronoiMaps];
    VoronoiMap *voronoiMap = voronoiMaps[indexPath.row];
    cell.textLabel.text = voronoiMap.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu Voronoi Cell Towers", (unsigned long)[voronoiMap.cellTowers count]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //
}


#pragma mark- Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:kSegueNewMap] || [segue.identifier isEqualToString:kSegueMapSettings]) {
        EditMapViewController *editMapVC = segue.destinationViewController;
        editMapVC.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:kSegueVoronoiMap]) {

        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSArray *voronoiMaps = [[VoronoiMapStore sharedStore] allVoronoiMaps];

        VoronoiMapViewController *voronoiMapVC = segue.destinationViewController;
        voronoiMapVC.vMap = voronoiMaps[indexPath.row];
    }

}

#pragma mark- BHEMapDetailsViewControllerDelegate methods
- (void)editMapDidSave:(EditMapViewController *)mapDetails {
    
    VoronoiMap *newVoronoiMap = [[VoronoiMap alloc] initWithTitle:mapDetails.titleField.text];
    [[VoronoiMapStore sharedStore] saveVoronoiMap:newVoronoiMap];
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

- (void)editMapDidCancel:(EditMapViewController *)mapDetails{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
