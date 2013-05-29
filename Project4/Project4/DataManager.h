//
//  DataManager.h
//  Project4
//
//  Created by Jason Bentley on 5/28/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"

@interface DataManager : NSObject
{
    
}
+ (void)initialize;
+(DataManager*)GetInstance;
-(void)printSettings:(NSString*)passedString;

@property NSString *passedText;

@end
