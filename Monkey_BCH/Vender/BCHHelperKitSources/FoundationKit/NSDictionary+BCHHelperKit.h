//
//  NSDictionary+BCHHelperKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BCHHelperKit)


- (id)bch_objectForKey:(id<NSCopying>)key;

- (int)bch_intForKey:(id<NSCopying>)key;

- (double)bch_doubleForKey:(id<NSCopying>)key;

- (float)bch_floatForKey:(id<NSCopying>)key;

- (NSInteger)bch_integerForKey:(id<NSCopying>)key;

- (NSString *)bch_stringForKey:(id<NSCopying>)key;

- (NSDictionary *)bch_dictionaryForKey:(id<NSCopying>)key;

- (NSArray *)bch_arrayForKey:(id<NSCopying>)key;

- (NSNumber *)bch_numberForKey:(id<NSCopying>)key;

- (BOOL)bch_boolForKey:(id<NSCopying>)key;

- (unsigned long long)bch_unsignedLongLongValue:(id<NSCopying>)key;

@end
