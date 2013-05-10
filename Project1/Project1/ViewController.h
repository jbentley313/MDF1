//
//  ViewController.h
//  Project1
//
//  Created by Jason Bentley on 5/7/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *tableView;
    NSMutableArray *groceryArray;
   
}

-(IBAction)onClick:(id)sender;

@end
