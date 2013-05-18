//
//  DataManager.h
//  Project3
//
//  Created by Jason Bentley on 5/18/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
{
    NSMutableArray *businesses;
}

+(DataManager*)sharedDataManager;

@property (nonatomic, strong)NSMutableArray *businesses;

@end
