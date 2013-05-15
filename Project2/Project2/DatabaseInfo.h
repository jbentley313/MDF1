//
//  DatabaseInfo.h
//  Project2
//
//  Created by Jason Bentley on 5/14/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseInfo : NSObject
{
    NSString *robot;
    NSString *robotInfo;
}

@property (strong, nonatomic)NSString *robot;
@property (strong, nonatomic)NSString *robotInfo;

-(id)initWithRobotName:(NSString*)name info:(NSString*)info;

@end
