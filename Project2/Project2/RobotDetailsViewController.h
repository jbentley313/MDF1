//
//  RobotDetailsViewController.h
//  Project2
//
//  Created by Jason Bentley on 5/14/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseInfo.h"

@interface RobotDetailsViewController : UIViewController

    @property(weak)IBOutlet UILabel *robotNameLabel;
    @property(weak)IBOutlet UITextView *robotInfoLabel;

@property(strong) DatabaseInfo *robotObject;



@end
