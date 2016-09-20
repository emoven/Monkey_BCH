//
//  NSMutableAttributedString+BCHHelperKit.m
//  TYHomeland
//
//  Created by yiliao on 16/9/8.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSMutableAttributedString+BCHHelperKit.h"

@implementation NSMutableAttributedString (BCHHelperKit)

+(NSMutableAttributedString *)bch_initWithString:(NSString *)string addAttribute:(NSString *)name value:(id)value range:(NSRange)range{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributeString addAttribute:name value:value range:range];
    return attributeString;
}

+(NSMutableAttributedString *)bch_initWithString:(NSString *)string addAttributes:(NSArray *)attributes value:(id)value range:(NSRange)range{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    for (int i = 0; i < attributes.count; i++) {
        [attributeString addAttribute:attributes[i] value:value range:range];
    }
    return attributeString;
}
@end
