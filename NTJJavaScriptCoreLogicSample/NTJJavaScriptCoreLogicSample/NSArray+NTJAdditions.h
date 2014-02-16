//
//  NSArray+NTJAdditions.h
//  NTJJavaScriptCoreLogicSample
//
//  Created by joshua may on 16/02/2014.
//  Copyright (c) 2014 notjosh, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (NTJAdditions)

- (NSIndexSet *)indexesOfAddedItemsInArray:(NSArray *)array;
- (NSIndexSet *)indexesOfRemovedItemsInArray:(NSArray *)array;

@end
