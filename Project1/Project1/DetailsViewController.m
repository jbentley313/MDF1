//
//  DetailsViewController.m
//  Project1
//
//  Created by Jason Bentley on 5/8/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "DetailsViewController.h"
#import "ViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//close button
-(IBAction)onClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    if (self.groceryInfo != nil) {
        nameLabel.text = self.groceryInfo.groceryName;
        tempLabel.text = self.groceryInfo.groceryTemp;
        NecLabel.text = self.groceryInfo.groceryNecessary;
    }
  
    [super viewDidAppear:animated];
    
}

@end
