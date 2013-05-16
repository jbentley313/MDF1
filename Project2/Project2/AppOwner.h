//
//  AppOwner.h
//  Project2
//
//  Created by Jason Bentley on 5/15/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppOwner : NSObject
{
    NSString *userName;
    NSString *userAge;
}

@property (strong, nonatomic)NSString *userName;
@property (strong, nonatomic)NSString *userAge;

-(id)initWithUserName:(NSString*)name age:(NSString*)age;
@end
