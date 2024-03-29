//
//  DetailsViewController.m
//  Project3
//
//  Created by Jason Bentley on 5/18/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "DetailsViewController.h"
#import <MapKit/MapKit.h>
#import "DataManager.h"
#import "myAnnotation.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize bizObject, bizLongLabel, bizLatLabel, bizNameLabel, businessesD;

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

    //convert coordinate numbers to NSStrings
    NSString *coordLatToString =[[NSNumber numberWithFloat:bizObject.locationB.latitude] stringValue];
    NSString *coordLongToString =[[NSNumber numberWithFloat:bizObject.locationB.longitude] stringValue];
    
    //set labels 
    bizNameLabel.text = bizObject.businessName;
    bizLatLabel.text = coordLatToString;
    bizLongLabel.text = coordLongToString;
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    //mapview span
    MKCoordinateSpan span;
    span.latitudeDelta= .5f;
    span.longitudeDelta= .5f;
    
    //set location from coords
    CLLocationCoordinate2D location;
    location.latitude = bizObject.locationB.latitude;
    location.longitude = bizObject.locationB.longitude;
    
    //region
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapview.region = region;
    
    //annotation
    MyAnnotation *myAnnotation1 = [[MyAnnotation alloc] initWithName:bizObject.businessName loc:location];
    if (myAnnotation1 != nil) {
        [mapview addAnnotation:myAnnotation1];
    }
}



@end
