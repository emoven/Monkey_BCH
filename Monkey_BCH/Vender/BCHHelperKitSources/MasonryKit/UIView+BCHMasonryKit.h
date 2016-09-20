//
//  UIView+BCHMasonryKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHHelperKit.h"

@interface UIView (BCHMasonryKit)

#pragma mark - create view
+(instancetype)bch_viewWithSuperView:(UIView *)superView;

+(instancetype)bch_viewWithSuperView:(UIView *)superView onTaped:(BCHTapGestureBlock)onTaped;

+(instancetype)bch_viewWithSuperView:(UIView *)superView constraints:(BCHConstraintMaker)contraints;

+(instancetype)bch_viewWithSuperView:(UIView *)superView constraints:(BCHConstraintMaker)contraints onTaped:(BCHTapGestureBlock)onTaped;

#pragma mark - add line
+(instancetype)bch_addTopLineToView:(UIView *)toView
                             height:(CGFloat)height
                              color:(UIColor *)color;

+(instancetype)bch_addTopLineToView:(UIView *)toView
                           distance:(CGFloat)distance
                             height:(CGFloat)height
                              color:(UIColor *)color;

+(instancetype)bch_addTopLineToView:(UIView *)toView
                        leftPadding:(CGFloat)leftPadding
                       rightPadding:(CGFloat)rightPadding
                             height:(CGFloat)height
                              color:(UIColor *)color;

+(instancetype)bch_addBottomLineToView:(UIView *)toView
                             height:(CGFloat)height
                              color:(UIColor *)color;

+(instancetype)bch_addBottomLineToView:(UIView *)toView
                           distance:(CGFloat)distance
                             height:(CGFloat)height
                              color:(UIColor *)color;

+(instancetype)bch_addBottomLineToView:(UIView *)toView
                        leftPadding:(CGFloat)leftPadding
                       rightPadding:(CGFloat)rightPadding
                             height:(CGFloat)height
                              color:(UIColor *)color;

@end
