//
//  NTJApplicationThing.h
//  NTJJavaScriptCoreLogicSample
//
//  Created by joshua may on 16/02/2014.
//  Copyright (c) 2014 notjosh, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NTJThingFinderServiceDelegate;

@interface NTJThingFinderService : NSObject

@property (nonatomic, assign) id<NTJThingFinderServiceDelegate> delegate;
@property (nonatomic, strong, readonly) NSArray *things;

/// Find some more things!
- (void)treasureHunt;

/// EXTERMINATE some things!
- (void)zap;

@end

@protocol NTJThingFinderServiceDelegate <NSObject>

- (void)applicationThing:(NTJThingFinderService *)applicationThing foundTreasureAtIndexes:(NSIndexSet *)indexes;
- (void)applicationThing:(NTJThingFinderService *)applicationThing zappedTreasureAtIndexes:(NSIndexSet *)indexes;

@end