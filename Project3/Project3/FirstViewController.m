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

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize businesses;

- (void)viewDidLoad
{
    //instantiate businessInfos
    BusinessInfo *info1 = [[BusinessInfo alloc] initWithName:@"Wendy's" loc:CLLocationCoordinate2DMake(26.4f, -80.3f)];
    
    BusinessInfo *info2 = [[BusinessInfo alloc] initWithName:@"Wendy's Elsewhere" loc:CLLocationCoordinate2DMake(46.4f, -30.3f)];
    
    //add objects to array in datamanager
    DataManager *manager = [DataManager sharedDataManager];
    if (manager !=nil) {
        businesses = manager.businesses;
        if (businesses !=nil) {
            [businesses addObject:info1];
            [businesses addObject:info2];
        }
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



//count items in array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DataManager *manager = [DataManager sharedDataManager];
   
        return [manager.businesses count];
    NSLog(@"%lu", (unsigned long)[manager.businesses count]);
}

//load reusable cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    BusinessInfo *passed = [businesses objectAtIndex:indexPath.row];
    
    cell.textLabel.text = passed.businessName;
    
    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
