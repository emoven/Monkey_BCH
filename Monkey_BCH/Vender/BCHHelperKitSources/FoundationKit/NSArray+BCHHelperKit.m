//
//  NSArray+BCHHelperKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSArray+BCHHelperKit.h"

@implementation NSArray (BCHHelperKit)

-(id)bch_objectAtIndex:(NSUInteger)index
{
    NSUInteger count = [self count];
    if (count > 0 && index < count) {
        return [self objectAtIndex:index];
    }
    return nil;
}

-(BOOL)bch_isContainsString:(NSString *)string
{
    for (NSString *element in self) {
        if ([element isKindOfClass:[NSString class]] && [element isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

-(NSArray *)bch_reverseArray
{
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for (id element in enumerator) {
        [arrayTemp addObject:element];
    }
    
    return arrayTemp;
}

@end
