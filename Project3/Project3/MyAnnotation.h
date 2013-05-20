//
//  myAnnotation.h
//  Project3
//
//  Created by Jason Bentley on 5/20/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h> 
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
    
}
-(id)initWithName:(NSString*)name loc:(CLLocationCoordinate2D)loc;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@end
