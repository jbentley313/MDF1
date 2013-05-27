//
//  Pony.h
//  Project4
//
//  Created by Jason Bentley on 5/26/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pony : NSObject
{
    NSString *name;
    NSString *tag;
    NSString *picUrl;
    NSString *thumbPicUrl;
    
}

-(id)initWithName:(NSString*)ponyName ponyTag:(NSString*)ponyTag pictureUrl:(NSString*)pictureUrl thumbPictureUrl:(NSString*)thumbPictureUrl;

@property NSString *name;
@property NSString *tag;
@property NSString *picUrl;
@property NSString *thumbPicUrl;


@end
