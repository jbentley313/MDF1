//
//  DetailsPonyViewController.m
//  Project4
//
//  Created by Jason Bentley on 5/27/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "DetailsPonyViewController.h"

@interface DetailsPonyViewController ()

@end

@implementation DetailsPonyViewController
@synthesize ponyPic, ponyTags, ponyNameLabel;

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
    //set labels with passed info from pony object
    ponyNameLabel.text = self.ponyObject.name;
    ponyTags.text = self.ponyObject.tag;
    
    
    NSURL *url = [[NSURL alloc] initWithString:self.ponyObject.picUrl];
    if (url != nil) {
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        if (request != nil) {
            ponyPic .scalesPageToFit = YES;
            [ponyPic loadRequest:request];
        }
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
