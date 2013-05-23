//
//  FirstViewController.h
//  Project3
//
//  Created by Jason Bentley on 5/18/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UITableViewController <UITableViewDelegate>
{
    NSMutableArray *businessesF;
    IBOutlet UITableView *tableView;
    IBOutlet UIButton *editBtn;
    UISwipeGestureRecognizer *rightSwipe;

}
-(IBAction)onClick:(id)sender;

@property(strong) NSMutableArray *businessesF;



@end
