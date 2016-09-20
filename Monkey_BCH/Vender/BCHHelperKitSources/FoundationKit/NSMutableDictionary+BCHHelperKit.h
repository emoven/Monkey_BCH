//
//  NSMutableDictionary+BCHHelperKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (BCHHelperKit)

- (BOOL)bch_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

- (BOOL)bch_setValue:(id)value forKey:(NSString *)key;

@end
