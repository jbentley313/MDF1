//
//  myAnnotation.m
//  Project3
//
//  Created by Jason Bentley on 5/20/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "MyAnnotation.h"


@implementation MyAnnotation
@synthesize title, coordinate;

-(id)initWithName:(NSString*)name loc:(CLLocationCoordinate2D)loc
{
    if ((self = [super init])) {
        title = name;
        coordinate = loc;
    }
    
    return self;
}
@end
