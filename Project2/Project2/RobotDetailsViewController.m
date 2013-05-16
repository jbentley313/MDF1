//
//  RobotDetailsViewController.m
//  Project2
//
//  Created by Jason Bentley on 5/14/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "RobotDetailsViewController.h"
#import "DatabaseInfo.h"
#import "DataBaseViewController.h"

@interface RobotDetailsViewController ()

@end

@implementation RobotDetailsViewController
@synthesize robotNameLabel, robotInfoLabel, robotObject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    robotNameLabel.text = self.robotObject.robot;
    robotInfoLabel.text = self.robotObject.robotInfo;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
