//
//  NSMutableAttributedString+BCHHelperKit.h
//  TYHomeland
//
//  Created by yiliao on 16/9/8.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (BCHHelperKit)
+(NSMutableAttributedString *)bch_initWithString:(NSString *)string addAttribute:(NSString *)name value:(id)value range:(NSRange)range;

+(NSMutableAttributedString *)bch_initWithString:(NSString *)string addAttributes:(NSArray *)attributes value:(id)value range:(NSRange)range;

@end
