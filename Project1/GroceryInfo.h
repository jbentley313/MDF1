//
//  GroceryInfo.h
//  Project1
//
//  Created by Jason Bentley on 5/8/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroceryInfo : NSObject
{
    NSString *groceryName;
    NSString *groceryTemp;
    NSString *groceryNecessary;
    
}

-(id)initWithGroceryName:(NSString*)name temp:(NSString*)temp necessary:(NSString*)necessary;

@property (nonatomic, strong)NSString *groceryName;
@property (nonatomic, strong)NSString *groceryTemp;
@property (nonatomic, strong)NSString *groceryNecessary;

@end