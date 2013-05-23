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
@synthesize fullMapView, allBusinessesArray;

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
    //remove all existing annotations
    NSMutableArray * removeTheseAnnotations = [fullMapView.annotations mutableCopy] ;
    
    [fullMapView removeAnnotations:removeTheseAnnotations ] ;

    
    //get array from data manager
    DataManager *manager = [DataManager sharedDataManager];
    
    allBusinessesArray = manager.businessesMG;
    
    //loop through all businesses and create annotations
    for (int i = 0 ; i < allBusinessesArray.count; i++) {
        MyAnnotation *fullMapAnns = [[MyAnnotation alloc] initWithName:[[allBusinessesArray objectAtIndex:i]businessName] loc:[[allBusinessesArray objectAtIndex:i]locationB]];
    
        //add annotations
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
