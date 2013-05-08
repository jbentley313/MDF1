//
//  ViewController.m
//  Project1
//
//  Created by Jason Bentley on 5/7/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "ViewController.h"

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return groceryArray.count;
}

//load array into reusable cells
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    static int count = 0;
    cell.textLabel.text = (NSString*)[groceryArray objectAtIndex:indexPath.row];
    
    count ++;
    return cell;
}

//selected row method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
