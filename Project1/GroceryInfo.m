//
//  GroceryInfo.m
//  Project1
//
//  Created by Jason Bentley on 5/8/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "GroceryInfo.h"

@implementation GroceryInfo
@synthesize groceryName, groceryNecessary, groceryTemp;

-(id)initWithGroceryName:(NSString*)name temp:(NSString*)temp necessary:(NSString*)necessary;
{
    if (self = [super init]) {
        groceryName = name;
        groceryTemp = temp;
        groceryNecessary = necessary;
    }
    return self;
    
}


@end
