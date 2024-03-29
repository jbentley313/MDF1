//
//  DetailsViewController.h
//  Project3
//
//  Created by Jason Bentley on 5/18/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FirstViewController.h"
#import "BusinessInfo.h"
#import "DataManager.h"

@interface DetailsViewController : UIViewController 
{
    IBOutlet MKMapView *mapview;
    NSMutableArray *businessesD;
}

@property(weak)IBOutlet UILabel *bizNameLabel;
@property(weak)IBOutlet UILabel *bizLatLabel;
@property(weak)IBOutlet UILabel *bizLongLabel;

@property(strong) BusinessInfo *bizObject;
@property(strong) NSMutableArray *businessesD;


@end
