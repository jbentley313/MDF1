//
//  DataManager.m
//  Project3
//
//  Created by Jason Bentley on 5/18/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

@synthesize businessesMG;

static DataManager* _sharedDataManager = nil;


+(DataManager*)sharedDataManager
{
    if (!_sharedDataManager) {
        _sharedDataManager = [[self alloc] init];
    }
    return _sharedDataManager;
}

-(id)init
{
    if ((self = [super init])) {
        businessesMG = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
