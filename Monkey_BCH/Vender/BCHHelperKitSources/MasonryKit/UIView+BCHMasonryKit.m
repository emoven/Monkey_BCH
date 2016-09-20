//
//  UIView+BCHMasonryKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIView+BCHMasonryKit.h"

@implementation UIView (BCHMasonryKit)

#pragma mark - create view
+(instancetype)bch_viewWithSuperView:(UIView *)superView
{
    return [self bch_viewWithSuperView:superView onTaped:nil];
}

+(instancetype)bch_viewWithSuperView:(UIView *)superView onTaped:(BCHTapGestureBlock)onTaped
{
    return [self bch_viewWithSuperView:superView constraints:nil onTaped:onTaped];
}

+(instancetype)bch_viewWithSuperView:(UIView *)superView constraints:(BCHConstraintMaker)contraints
{
    return [self bch_viewWithSuperView:superView constraints:contraints onTaped:nil];
}

+(instancetype)bch_viewWithSuperView:(UIView *)superView constraints:(BCHConstraintMaker)contraints onTaped:(BCHTapGestureBlock)onTaped
{
    UIView *view = [[[self class] alloc]init];
    if (onTaped) {
        [view bch_addTapGestureWithCallBack:onTaped];
    }
    
    
    
    return view;
}

#pragma mark - add line
+(instancetype)bch_addTopLineToView:(UIView *)toView
                             height:(CGFloat)height
                              color:(UIColor *)color
{
    return [self bch_addTopLineToView:toView
                             distance:0
                               height:height
                                color:color];
}

+(instancetype)bch_addTopLineToView:(UIView *)toView
                           distance:(CGFloat)distance
                             height:(CGFloat)height
                              color:(UIColor *)color
{
    return [self bch_private_addLineToView:toView
                                     isTop:YES
                                  distance:distance
                               leftPadding:0
                              rightPadding:0
                                    height:height
                                     color:color];
}

+(instancetype)bch_addTopLineToView:(UIView *)toView
                        leftPadding:(CGFloat)leftPadding
                       rightPadding:(CGFloat)rightPadding
                             height:(CGFloat)height
                              color:(UIColor *)color
{
    return [self bch_private_addLineToView:toView
                                     isTop:YES
                                  distance:0
                               leftPadding:leftPadding
                              rightPadding:rightPadding
                                    height:height
                                     color:color];
}

+(instancetype)bch_addBottomLineToView:(UIView *)toView
                                height:(CGFloat)height
                                 color:(UIColor *)color
{
    return [self bch_addBottomLineToView:toView
                                distance:0
                                  height:height
                                   color:color];
}

+(instancetype)bch_addBottomLineToView:(UIView *)toView
                              distance:(CGFloat)distance
                                height:(CGFloat)height
                                 color:(UIColor *)color
{
    return [self bch_private_addLineToView:toView
                                     isTop:NO
                                  distance:distance
                               leftPadding:0
                              rightPadding:0
                                    height:height
                                     color:color];
}

+(instancetype)bch_addBottomLineToView:(UIView *)toView
                           leftPadding:(CGFloat)leftPadding
                          rightPadding:(CGFloat)rightPadding
                                height:(CGFloat)height
                                 color:(UIColor *)color
{
    return [self bch_private_addLineToView:toView
                                     isTop:NO
                                  distance:0
                               leftPadding:leftPadding
                              rightPadding:rightPadding
                                    height:height
                                     color:color];
}

#pragma mark - Private
+ (instancetype)bch_private_addLineToView:(UIView *)toView
                                    isTop:(BOOL)isTop
                                 distance:(CGFloat)distance
                              leftPadding:(CGFloat)leftPadding
                             rightPadding:(CGFloat)rightPadding
                                   height:(CGFloat)height
                                    color:(UIColor *)color {
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = color;
    if (toView) {
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftPadding);
            if (isTop) {
                make.top.mas_equalTo(distance);
            }else{
                make.bottom.mas_equalTo(distance);
            }
            make.right.mas_equalTo(rightPadding);
            make.height.mas_equalTo(height);
        }];
    }
    return lineView;
}

@end
