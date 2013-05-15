//
//  DatabaseInfo.m
//  Project2
//
//  Created by Jason Bentley on 5/14/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "DatabaseInfo.h"

@implementation DatabaseInfo
@synthesize robot, robotInfo;


-(id)initWithRobotName:(NSString*)name info:(NSString*)info
{
    if (self = [super init]) {
        robot = name;
        robotInfo = info;
    }
    return self;
}

@end
