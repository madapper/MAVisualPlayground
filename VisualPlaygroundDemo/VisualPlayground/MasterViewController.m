//
//  MasterViewController.m
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "MASparks.h"
#import "MAFlyingFrames.h"
#import "MARandomColors.h"
#import "MAColorScroll.h"

@interface MasterViewController () {
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.arrVisuals = @[@"Sparks",@"Flying Frames",@"Random Colors",@"Color Scroll"];
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrVisuals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.textLabel.text = self.arrVisuals[indexPath.row];
    return cell;
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
   NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    switch (indexPath.row) {
        case 0:{
            MASparks *view = [[MASparks alloc]initWithFrame:self.view.bounds];
            [[segue destinationViewController] setDetailView:view];
        }
            break;
            
        case 1:{
            MAFlyingFrames *view = [[MAFlyingFrames alloc]initWithFrame:self.view.bounds];
            [[segue destinationViewController] setDetailView:view];
        }
            break;
            
        case 2:{
            MARandomColors *view = [[MARandomColors alloc]initWithFrame:self.view.bounds];
            [view writeWord:@"testword" fromPoint:CGPointMake(0, 0) withBorder:false];
            [[segue destinationViewController] setDetailView:view];
        }
            break;
            
        case 3:{
            MAColorScroll *view = [[MAColorScroll alloc]initWithFrame:self.view.bounds];
            [[segue destinationViewController] setDetailView:view];
        }
            break;
            
        default:
            break;
    }
    
    
    
}


@end
