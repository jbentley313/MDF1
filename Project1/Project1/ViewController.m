//
//  ViewController.m
//  Project1
//
//  Created by Jason Bentley on 5/7/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"
#import "GroceryInfo.h"
#import "DetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    groceryArray = [[NSMutableArray alloc]init];
    
    //grocery items to add
    GroceryInfo *info1 = [[GroceryInfo alloc] initWithGroceryName:@"eggs" temp:@"cold" necessary:@"yes"];
    GroceryInfo *info2 = [[GroceryInfo alloc] initWithGroceryName:@"milk" temp:@"cold" necessary:@"yes"];
    GroceryInfo *info3 = [[GroceryInfo alloc] initWithGroceryName:@"peanut butter" temp:@"room" necessary:@"no"];
    GroceryInfo *info4 = [[GroceryInfo alloc] initWithGroceryName:@"tuna" temp:@"room" necessary:@"no"];
    GroceryInfo *info5 = [[GroceryInfo alloc] initWithGroceryName:@"chicken tenders" temp:@"cold" necessary:@"yes"];
    GroceryInfo *info6 = [[GroceryInfo alloc] initWithGroceryName:@"soy milk" temp:@"cold" necessary:@"yes"];
    GroceryInfo *info7 = [[GroceryInfo alloc] initWithGroceryName:@"turkey" temp:@"cold" necessary:@"yes"];
    GroceryInfo *info8 = [[GroceryInfo alloc] initWithGroceryName:@"butter finger" temp:@"room" necessary:@"no"];
    GroceryInfo *info9 = [[GroceryInfo alloc] initWithGroceryName:@"ranch dressing" temp:@"room" necessary:@"yes"];
    GroceryInfo *info10 = [[GroceryInfo alloc] initWithGroceryName:@"whipped cream" temp:@"cold" necessary:@"yes"];
    GroceryInfo *info11 = [[GroceryInfo alloc] initWithGroceryName:@"creamer" temp:@"cold" necessary:@"yes"];
    GroceryInfo *info12 = [[GroceryInfo alloc] initWithGroceryName:@"coffee" temp:@"room" necessary:@"yes"];
    GroceryInfo *info13 = [[GroceryInfo alloc] initWithGroceryName:@"pork roast" temp:@"cold" necessary:@"no"];
    GroceryInfo *info14 = [[GroceryInfo alloc] initWithGroceryName:@"tortilla chips" temp:@"room" necessary:@"no"];
    GroceryInfo *info15 = [[GroceryInfo alloc] initWithGroceryName:@"doritos" temp:@"room" necessary:@"yes"];
    GroceryInfo *info16 = [[GroceryInfo alloc] initWithGroceryName:@"cheese" temp:@"cold" necessary:@"yes"];
    GroceryInfo *info17 = [[GroceryInfo alloc] initWithGroceryName:@"fishys" temp:@"room" necessary:@"yes"];
    GroceryInfo *info18 = [[GroceryInfo alloc] initWithGroceryName:@"salmon" temp:@"cold" necessary:@"no"];
    GroceryInfo *info19 = [[GroceryInfo alloc] initWithGroceryName:@"bagels" temp:@"room" necessary:@"no"];
    GroceryInfo *info20 = [[GroceryInfo alloc] initWithGroceryName:@"cream cheese" temp:@"cold" necessary:@"no"];
    
    //add grocery items to mutable array
    [groceryArray addObject:info1];
    [groceryArray addObject:info2];
    [groceryArray addObject:info3];
    [groceryArray addObject:info4];
    [groceryArray addObject:info5];
    [groceryArray addObject:info6];
    [groceryArray addObject:info7];
    [groceryArray addObject:info8];
    [groceryArray addObject:info9];
    [groceryArray addObject:info10];
    [groceryArray addObject:info11];
    [groceryArray addObject:info12];
    [groceryArray addObject:info13];
    [groceryArray addObject:info14];
    [groceryArray addObject:info15];
    [groceryArray addObject:info16];
    [groceryArray addObject:info17];
    [groceryArray addObject:info18];
    [groceryArray addObject:info19];
    [groceryArray addObject:info20];
    
    
    
        [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//count items in array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [groceryArray count];
}

//load array into reusable custom cells
- (CustomTableCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"Cell";
    
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
       //display custom cell
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"customCellView" owner:nil options:nil];
        for (UIView *view in views) {
            if ([view isKindOfClass:[CustomTableCell class]]) {
                
                cell = (CustomTableCell*)view;
                GroceryInfo *info= [groceryArray objectAtIndex:indexPath.row];
                cell.textLabel.text =  info.groceryName;
            }
        }
    }
    
    static int count = 0;
    
    count ++;
    return cell;
}

//selected row method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroceryInfo *info = [groceryArray objectAtIndex:indexPath.row];
    
    DetailsViewController *viewcontroller = [[DetailsViewController alloc] initWithNibName:@"DetailsView" bundle:nil];
    [self presentViewController:viewcontroller animated:YES completion:nil];
    
    viewcontroller.GroceryInfo = info;
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
- (void)tableView:(UITableView *)tableView2 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
{
    //remove object from array if "delete" is the editing style
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [groceryArray removeObjectAtIndex:indexPath.row];
        
        //remove from tableview as well
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
        
    }
}


@end
