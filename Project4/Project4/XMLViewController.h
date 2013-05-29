//
//  XMLViewController.h
//  Project4
//
//  Created by Jason Bentley on 5/25/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"



@interface XMLViewController : UIViewController <UITextFieldDelegate>
{
     IBOutlet UITextView *xmlRawView;
}

//@property(strong, nonatomic) NSString *xmlRaw;
@end
