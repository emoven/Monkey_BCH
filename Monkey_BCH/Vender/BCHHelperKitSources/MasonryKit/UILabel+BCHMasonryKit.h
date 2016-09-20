//
//  UILabel+BCHMasonryKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/22.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHHelperKit.h"

@interface UILabel (BCHMasonryKit)

+(instancetype)bch_lableWithFont:(CGFloat)font;

+(instancetype)bch_lableWithText:(NSString *)text
                            font:(CGFloat)font;

+(instancetype)bch_lableWithFont:(CGFloat)font
                       superView:(UIView *)superView
                     constraints:(BCHConstraintMaker)constraints;

+(instancetype)bch_lableWithText:(NSString *)text
                            font:(CGFloat)font
                       superView:(UIView *)superView
                     constraints:(BCHConstraintMaker)constraints;

+(instancetype)bch_lableWithText:(NSString *)text
                            font:(CGFloat)font
                           lines:(NSInteger)lines
                       superView:(UIView *)superView
                     constraints:(BCHConstraintMaker)constraints;

@end
