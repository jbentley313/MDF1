//
//  FirstViewController.m
//  Project3
//
//  Created by Jason Bentley on 5/18/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "FirstViewController.h"
#import "BusinessInfo.h"
#import "DataManager.h"
#import "DetailsViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize businessesF;

- (void)viewDidLoad
{
        //instantiate businessInfos
    BusinessInfo *info1 = [[BusinessInfo alloc] initWithName:@"Bob's Custom Glasses" loc:CLLocationCoordinate2DMake(39.880542f, -86.249249f)];
    
    BusinessInfo *info2 = [[BusinessInfo alloc] initWithName:@"Wendy's Codefactory" loc:CLLocationCoordinate2DMake(46.42f, -30.32f)];
    
    BusinessInfo *info3 = [[BusinessInfo alloc] initWithName:@"Jason's Biz" loc:CLLocationCoordinate2DMake(26.4f, -80.3f)];
    
    BusinessInfo *info4 = [[BusinessInfo alloc] initWithName:@"Acacia Store" loc:CLLocationCoordinate2DMake(46.4f, -30.3f)];
    
    BusinessInfo *info5 = [[BusinessInfo alloc] initWithName:@"Teva's Toys" loc:CLLocationCoordinate2DMake(26.4f, -80.3f)];
    
    BusinessInfo *info6 = [[BusinessInfo alloc] initWithName:@"Homes by Keith" loc:CLLocationCoordinate2DMake(46.4f, -30.3f)];
    
    BusinessInfo *info7 = [[BusinessInfo alloc] initWithName:@"Jane's Fried Chicken" loc:CLLocationCoordinate2DMake(26.4f, -80.3f)];
    
    BusinessInfo *info8 = [[BusinessInfo alloc] initWithName:@"Fake Frostys" loc:CLLocationCoordinate2DMake(46.4f, -30.3f)];
    
    BusinessInfo *info9 = [[BusinessInfo alloc] initWithName:@"Bunk's Burgers" loc:CLLocationCoordinate2DMake(26.4f, -80.3f)];
    
    BusinessInfo *info10 = [[BusinessInfo alloc] initWithName:@"Pretend Places" loc:CLLocationCoordinate2DMake(46.4f, -30.3f)];
    
    //add objects to array in datamanager
    DataManager *manager = [DataManager sharedDataManager];
    if (manager !=nil) {
        businessesF = manager.businessesMG;
        if (businessesF !=nil) {
            [businessesF addObject:info1];
            [businessesF addObject:info2];
            [businessesF addObject:info3];
            [businessesF addObject:info4];
            [businessesF addObject:info5];
            [businessesF addObject:info6];
            [businessesF addObject:info7];
            [businessesF addObject:info8];
            [businessesF addObject:info9];
            [businessesF addObject:info10];
        }
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



//count items in array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DataManager *manager = [DataManager sharedDataManager];
    
    return [manager.businessesMG count];
}

//load reusable cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
//    DataManager *manager = [DataManager sharedDataManager];
//    
//        businessesF = manager.businessesMG;
    
    static NSString *CellIdentifier = @"Celli";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    BusinessInfo *passed = [businessesF objectAtIndex:indexPath.row];
    
    cell.textLabel.text = passed.businessName;
    
    
    return cell;
}

//table cell editing style
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//edit button
-(IBAction)onClick:(id)sender
{
    UIButton *button = [UIButton alloc];
    if (button != nil) {
        if (tableView.editing == NO) {
            //editing mode enable
            [tableView setEditing:YES animated:YES];
        }
        else {
            //editing disable
            [tableView setEditing:NO animated:YES];
        }
    }
}

//commit edit (delete)
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
{
    //remove object from array if "delete" is the editing style
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [businessesF removeObjectAtIndex:indexPath.row];
        
        //remove from tableview as well
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
        
    }
    

}


//segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailsSegue"]) {
//        DataManager *manager = [DataManager sharedDataManager];
//       
//            businessesF = manager.businessesMG;
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        BusinessInfo *bizSelected = [businessesF objectAtIndex:indexPath.row];
        
        DetailsViewController *BusinessDetails = (DetailsViewController *)segue.destinationViewController;
        
        BusinessDetails.bizObject = bizSelected;
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
