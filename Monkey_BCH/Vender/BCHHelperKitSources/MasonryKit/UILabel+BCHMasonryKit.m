//
//  UILabel+BCHMasonryKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/22.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UILabel+BCHMasonryKit.h"

@implementation UILabel (BCHMasonryKit)

+(instancetype)bch_lableWithFont:(CGFloat)font
{
    return [self bch_lableWithText:nil font:font lines:1 superView:nil constraints:nil];
}

+(instancetype)bch_lableWithText:(NSString *)text
                            font:(CGFloat)font
{
    return [self bch_lableWithText:text font:font lines:1 superView:nil constraints:nil];
}

+(instancetype)bch_lableWithFont:(CGFloat)font
                       superView:(UIView *)superView
                     constraints:(BCHConstraintMaker)constraints
{
    return [self bch_lableWithText:nil font:font lines:1 superView:superView constraints:constraints];
}

+(instancetype)bch_lableWithText:(NSString *)text
                            font:(CGFloat)font
                       superView:(UIView *)superView
                     constraints:(BCHConstraintMaker)constraints
{
    return [self bch_lableWithText:text font:font lines:1 superView:superView constraints:constraints];
}

+(instancetype)bch_lableWithText:(NSString *)text
                            font:(CGFloat)font
                           lines:(NSInteger)lines
                       superView:(UIView *)superView
                     constraints:(BCHConstraintMaker)constraints
{
    UILabel *lable = [[UILabel alloc]init];
    lable.text = text;
    lable.font = kFontWithSize(font);
    lable.numberOfLines = lines;
    lable.textAlignment = NSTextAlignmentLeft;
    lable.textColor = kBlackColor;
    lable.backgroundColor = kClearColor;
    
    if (lines <= 0) {
        lable.lineBreakMode = NSLineBreakByWordWrapping;
    } else {
        lable.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    
    [superView addSubview:lable];
    
    if (superView && constraints) {
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    
    return lable;
}

@end
