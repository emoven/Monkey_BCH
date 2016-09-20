//
//  NSMutableArray+BCHHelperKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (BCHHelperKit)

- (BOOL)bch_addObject:(id)object;


- (BOOL)bch_insertObject:(id)anObject atIndex:(NSUInteger)index;


- (BOOL)bch_removeObjectAtIndex:(NSUInteger)index;


- (BOOL)bch_exchangeObjectFromIndex:(NSUInteger)fromIndex
                            toIndex:(NSUInteger)toIndex;

@end
