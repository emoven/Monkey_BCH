//
//  NSMutableArray+BCHHelperKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSMutableArray+BCHHelperKit.h"
#import "NSArray+BCHHelperKit.h"


@implementation NSMutableArray (BCHHelperKit)


- (BOOL)bch_addObject:(id)object {
    BOOL ret = NO;
    if (object) {
        ret = YES;
        [self addObject:object];
    }
    
    return ret;
}

- (BOOL)bch_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil|| index > [self count] ) {
        return NO;
    }
    
    if ([self containsObject:anObject]) {
        return NO;
    }
    
    [self insertObject:anObject atIndex:index];
    
    return YES;
}

- (BOOL)bch_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return NO;
    }
    
    [self removeObjectAtIndex:index];
    
    return YES;
}

- (BOOL)bch_exchangeObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if ([self count] != 0 && toIndex != fromIndex
        && fromIndex < [self count] && toIndex < [self count]) {
        [self exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
        
        return YES;
    }
    
    return NO;
}


@end
