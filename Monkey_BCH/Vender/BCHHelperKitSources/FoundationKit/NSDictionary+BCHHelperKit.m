//
//  NSDictionary+BCHHelperKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSDictionary+BCHHelperKit.h"
#import "BCHCommonKit.h"


@implementation NSDictionary (BCHHelperKit)

- (id)bch_objectForKey:(id<NSCopying>)key {
    if (key == nil) {
        return nil;
    }
    
    return [self objectForKey:key];
}

- (int)bch_intForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self bch_numberForKey:key];
    
    return [number intValue];
}

- (double)bch_doubleForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self bch_numberForKey:key];
    
    return [number doubleValue];
}

- (float)bch_floatForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self bch_numberForKey:key];
    
    return [number floatValue];
}

- (NSInteger)bch_integerForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self bch_numberForKey:key];
    
    return [number integerValue];
}

- (NSString *)bch_stringForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self bch_objectForKey:key];
    
    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString *)obj;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@", obj];
    }
    
    return nil;
}


- (NSDictionary *)bch_dictionaryForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self bch_objectForKey:key];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    }
    
    return nil;
}

- (NSArray *)bch_arrayForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self bch_objectForKey:key];
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *)obj;
    }
    
    return nil;
}

- (NSNumber *)bch_numberForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self bch_objectForKey:key];
    if ([obj isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)obj;
    }
    
    return nil;
}

- (BOOL)bch_boolForKey:(id)key {
    if (key == nil) {
        return NO;
    }
    
    id number = [self bch_objectForKey:key];
    if ([number respondsToSelector:@selector(boolValue)]) {
        return [number boolValue];
    }
    
    return NO;
}

- (unsigned long long)bch_unsignedLongLongValue:(id<NSCopying>)key {
    if (key == nil) {
        return 0;
    }
    
    id number = [self bch_objectForKey:key];
    if ([number respondsToSelector:@selector(unsignedLongLongValue)]) {
        return [number unsignedLongLongValue];
    }
    
    return 0;
}

@end
