//
//  NSUserDefaults+BCHHelperKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSUserDefaults+BCHHelperKit.h"
#import "NSObject+BCHHelperKit.h"


@implementation NSUserDefaults (BCHHelperKit)

- (BOOL)bch_setSafeObject:(id)value forKey:(NSString *)key {
    if (value == nil || key == nil || [value isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        [self setObject:value forKey:key];
        [self synchronize];
        return YES;
    } else {
        id result = [value bch_filterNullNil];
        if (result) {
            [self setObject:result forKey:key];
            [self synchronize];
            
            return YES;
        }
    }
    
    return NO;
}

@end
