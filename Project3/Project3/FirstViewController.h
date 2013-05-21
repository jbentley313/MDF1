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
    NSMutableArray *businesses;
    IBOutlet UITableView *tableView;
    
}
-(IBAction)onClick:(id)sender;

@property NSMutableArray *businesses;


@end
