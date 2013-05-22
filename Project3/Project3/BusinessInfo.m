//
//  BusinessInfo.m
//  Project3
//
//  Created by Jason Bentley on 5/18/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "BusinessInfo.h"

@implementation BusinessInfo


@synthesize businessName, locationB;

-(id)initWithName:(NSString*)name loc:(CLLocationCoordinate2D)loc
{
    if ((self = [super init])) {
        businessName = name;
        locationB = loc;
    }
    
    return self;
}

@end
