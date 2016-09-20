//
//  NSMutableDictionary+BCHHelperKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSMutableDictionary+BCHHelperKit.h"

@implementation NSMutableDictionary (BCHHelperKit)

- (BOOL)bch_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (aKey == nil || anObject == nil) {
        return NO;
    }
    
    [self setObject:anObject forKey:aKey];
    
    return YES;
}

- (BOOL)bch_setValue:(id)value forKey:(NSString *)key {
    if (key == nil || value == nil) {
        return NO;
    }
    
    [self setValue:value forKey:key];
    
    return YES;
}

@end
