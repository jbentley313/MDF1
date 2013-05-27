//
//  Pony.m
//  Project4
//
//  Created by Jason Bentley on 5/26/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "Pony.h"

@implementation Pony
@synthesize picUrl, tag, name, thumbPicUrl;
-(id)initWithName:(NSString*)ponyName ponyTag:(NSString*)ponyTag pictureUrl:(NSString*)pictureUrl thumbPictureUrl:(NSString*)thumbPictureUrl
{
    if ((self = [super init]))
    {
        name = ponyName;
        tag = ponyTag;
        picUrl = pictureUrl;
        thumbPicUrl = thumbPictureUrl;
    }
    return self;
}

@end
