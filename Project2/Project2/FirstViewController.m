//
//  FirstViewController.m
//  Project2
//
//  Created by Jason Bentley on 5/13/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize AppOwnerArray, AppOwnerAge, AppOwnerName;

- (void)viewDidLoad
{
    AppOwner *owner1 = [[AppOwner alloc] initWithUserName:@"Jason" age:@"34"];
    
    AppOwnerArray = [NSArray arrayWithObject:owner1];
    
    //set label to owner object text
    AppOwnerName.text = owner1.userName;
    AppOwnerAge.text = owner1.userAge;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
