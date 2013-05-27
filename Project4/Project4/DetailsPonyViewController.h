//
//  DetailsPonyViewController.h
//  Project4
//
//  Created by Jason Bentley on 5/27/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pony.h"

@interface DetailsPonyViewController : UIViewController


@property(weak)IBOutlet UILabel *ponyNameLabel;
@property(weak)IBOutlet UITextView *ponyTags;
@property IBOutlet UIWebView *ponyPic;

@property(strong) Pony *ponyObject;

@end
