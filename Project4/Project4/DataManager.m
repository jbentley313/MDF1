//
//  DataManager.m
//  Project4
//
//  Created by Jason Bentley on 5/28/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "DataManager.h"
#import "FirstViewController.h"
#import "XMLViewController.h"

@implementation DataManager
@synthesize passedText;

static DataManager *_instance;

+ (void)initialize
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        _instance = [[DataManager alloc] init];
    }
}

+(DataManager*)GetInstance
{
    if (_instance != nil) {
        return _instance;
    }
    return nil;
}

+(id)alloc
{
    _instance = [super alloc];
    return _instance;
    
}

-(void)printSettings:(NSString*)passedString;
{
    if (passedString != nil) {
        [self setPassedText:passedString];
    }
}

@end
