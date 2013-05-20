//
//  BusinessInfo.h
//  Project3
//
//  Created by Jason Bentley on 5/18/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BusinessInfo : NSObject <MKAnnotation>
{
    NSString *businessName;
    CLLocationCoordinate2D coordinate;
}
-(id)initWithName:(NSString*)name loc:(CLLocationCoordinate2D)loc;
@property (nonatomic, copy) NSString *businessName;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
