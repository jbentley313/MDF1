//
//  DetailsViewController.h
//  Project1
//
//  Created by Jason Bentley on 5/8/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroceryInfo.h"


@interface DetailsViewController : UIViewController
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *tempLabel;
    IBOutlet UILabel *NecLabel;
}

-(IBAction)onClick:(id)sender;

@property (nonatomic, strong)GroceryInfo *groceryInfo;
@end
