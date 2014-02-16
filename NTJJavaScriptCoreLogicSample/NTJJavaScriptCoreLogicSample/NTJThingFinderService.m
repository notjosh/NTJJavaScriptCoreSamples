//
//  NTJApplicationThing.m
//  NTJJavaScriptCoreLogicSample
//
//  Created by joshua may on 16/02/2014.
//  Copyright (c) 2014 notjosh, inc. All rights reserved.
//

#import "NTJThingFinderService.h"

#import <JavaScriptCore/JavaScriptCore.h>
#import "NTJContext.h"

#import "NSArray+NTJAdditions.h"
#import "NTJThing.h"

@interface NTJThingFinderService ()

@property (nonatomic, strong) JSVirtualMachine *virtualMachine;
@property (nonatomic, strong) NTJContext *context;

@end

@implementation NTJThingFinderService

- (id)init
{
    self = [super init];
    if (self) {
        _virtualMachine = [[JSVirtualMachine alloc] init];
    }
    return self;
}

- (void)treasureHunt
{
    // pretend to be KVO-ish. manually. sorry :(
    NSArray *thingsBefore = self.things;
    
    [self.context[@"hunt"] callWithArguments:nil];

    [self.delegate applicationThing:self
             foundTreasureAtIndexes:[thingsBefore indexesOfAddedItemsInArray:self.things]];
}

- (void)zap
{
    // pretend to be KVO-ish. manually. sorry :(
    NSArray *thingsBefore = self.things;

    [self.context[@"zap"] callWithArguments:nil];

    [self.delegate applicationThing:self
            zappedTreasureAtIndexes:[thingsBefore indexesOfRemovedItemsInArray:self.things]];
}

#pragma mark - Accessor

- (NSArray *)things
{
    return [self.context[@"things"] toArray];
}

#pragma mark - Helper

- (NTJContext *)context
{
    if (nil == _context) {
        _context = [[NTJContext alloc] initWithVirtualMachine:self.virtualMachine];

        _context[@"Thing"] = [NTJThing class];

        [_context loadScript:@"app"];
    }

    return _context;
}

@end
