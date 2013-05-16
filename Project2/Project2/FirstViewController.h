//
//  FirstViewController.h
//  Project2
//
//  Created by Jason Bentley on 5/13/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppOwner.h"

@interface FirstViewController : UIViewController

@property IBOutlet UILabel *AppOwnerName;
@property IBOutlet UILabel *AppOwnerAge;

@property(strong)AppOwner *AppOwnerObject;

@property NSArray *AppOwnerArray;

@end
