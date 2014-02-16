//
//  NSArray+NTJAdditions.m
//  NTJJavaScriptCoreLogicSample
//
//  Created by joshua may on 16/02/2014.
//  Copyright (c) 2014 notjosh, inc. All rights reserved.
//

#import "NSArray+NTJAdditions.h"

@implementation NSArray (NTJAdditions)

- (NSIndexSet *)indexesOfAddedItemsInArray:(NSArray *)array
{
    NSMutableIndexSet *is = [NSMutableIndexSet indexSet];

    for (NSUInteger i = 0, j = 0; i < array.count; i++, j++) {
        while (i < array.count && (j >= self.count || array[i] != self[j])) {
            [is addIndex:i];
            i++;
        }
    }

    return [is copy];
}

- (NSIndexSet *)indexesOfRemovedItemsInArray:(NSArray *)array
{
    return [array indexesOfAddedItemsInArray:self];
}

@end
