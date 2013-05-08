//
//  ViewController.m
//  Project1
//
//  Created by Jason Bentley on 5/7/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    groceryArray = [[NSMutableArray alloc]initWithObjects:@"Milk",@"eggs", @"butter", @"Capri Sun", @"Turkey", @"Tuna", @"Mac & Cheese", @"Soy Milk", @"Chicken Tenders", @"Chicken Pattys", @"Pop Tarts", @"Peanut Butter", @"Flour", @"Tortillas", @"Beans", @"Sour Cream", @"Shredded Cheese", @"Chips", @"Monster Energy Drink", @"Yogurt", @"bagels", @"bread",  nil];
    
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
    return groceryArray.count;
}

//load array into reusable cells
- (CustomTableCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"Cell";
    
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
       
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"customCellView" owner:nil options:nil];
        for (UIView *view in views) {
            if ([view isKindOfClass:[CustomTableCell class]]) {
                
                cell = (CustomTableCell*)view;
                cell.textLabel.text =  [groceryArray objectAtIndex:indexPath.row];
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
