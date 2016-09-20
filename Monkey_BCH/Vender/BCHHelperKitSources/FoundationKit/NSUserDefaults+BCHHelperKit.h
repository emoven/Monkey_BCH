//
//  NSUserDefaults+BCHHelperKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (BCHHelperKit)

- (BOOL)bch_setSafeObject:(id)value forKey:(NSString *)key;

@end
