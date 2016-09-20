//
//  NSObject+BCHHelperKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (BCHHelperKit)


- (NSString *)bch_className;

+ (NSMutableData *)bch_toJsonDataWithObject:(id)object;

- (NSMutableData *)bch_toJsonData;

+ (NSString *)bch_toJsonStringWithObject:(id)object;

- (NSString *)bch_toJsonString;

- (id)bch_filterNullNil;

+ (id)bch_filterNullNilFromObject:(id)object;

@end
