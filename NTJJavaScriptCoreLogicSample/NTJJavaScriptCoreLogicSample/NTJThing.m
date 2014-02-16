//
//  NTJThing.m
//  NTJJavaScriptCoreLogicSample
//
//  Created by joshua may on 16/02/2014.
//  Copyright (c) 2014 notjosh, inc. All rights reserved.
//

#import "NTJThing.h"

@implementation NTJThing

@synthesize title, body;

+ (NTJThing *)thing
{
    return [[self alloc] init];
}

@end
