//
//  XMLViewController.m
//  Project4
//
//  Created by Jason Bentley on 5/25/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "XMLViewController.h"
#import "FirstViewController.h"
#import "DataManager.h"


@interface XMLViewController ()

@end

@implementation XMLViewController


- (void)viewDidLoad
{
    [DataManager initialize];
    
    
     [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillAppear:(BOOL)animated
{
    
    NSString *textFromSingleton = [[DataManager GetInstance]passedText];
    xmlRawView.text = textFromSingleton;
    //    xmlRawView.text = xmlRaw;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
