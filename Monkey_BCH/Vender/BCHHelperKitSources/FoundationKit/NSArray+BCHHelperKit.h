//
//  NSArray+BCHHelperKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BCHHelperKit)

-(id)bch_objectAtIndex:(NSUInteger)index;

-(BOOL)bch_isContainsString:(NSString *)string;

-(NSArray *)bch_reverseArray;

@end
