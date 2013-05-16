//
//  AppOwner.m
//  Project2
//
//  Created by Jason Bentley on 5/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "AppOwner.h"

@implementation AppOwner
@synthesize userName, userAge;


-(id)initWithUserName:(NSString*)name age:(NSString*)age
{
    if (self = [super init]) {
        userName = name;
        userAge = age;
    }
    return self;
}

@end
