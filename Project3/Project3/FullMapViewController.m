//
//  FullMapViewController.m
//  Project3
//
//  Created by Jason Bentley on 5/18/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "FullMapViewController.h"
#import "DetailsViewController.h"
#import "DataManager.h"
#import "MyAnnotation.h"
#import <MapKit/MapKit.h>

@interface FullMapViewController ()

@end

@implementation FullMapViewController
@synthesize fullMapView;

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

- (void)viewDidAppear:(BOOL)animated
{
    DataManager *manager = [DataManager sharedDataManager];
    
    allBusinessesArray = manager.businessesMG;
    
    
    for (int i = 0 ; i < allBusinessesArray.count; i++) {
        MyAnnotation *fullMapAnns = [[MyAnnotation alloc] initWithName:[[allBusinessesArray objectAtIndex:i]businessName] loc:[[allBusinessesArray objectAtIndex:i]locationB]];
        
        [fullMapView addAnnotation:fullMapAnns];
    }
    
    //mapview span
    MKCoordinateSpan span;
    span.latitudeDelta= 20.0f;
    span.longitudeDelta= 20.0f;
    
    //region
    MKCoordinateRegion region;
    region.center = [[allBusinessesArray objectAtIndex:0]locationB];
    region.span = span;
    fullMapView.region = region;
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
