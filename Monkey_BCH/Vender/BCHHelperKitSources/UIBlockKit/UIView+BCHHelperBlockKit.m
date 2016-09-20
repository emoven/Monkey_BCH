//
//  UIView+BCHHelperBlockKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIView+BCHHelperBlockKit.h"
#import <objc/runtime.h>

static const void *s_bch_tapGestureKey = "s_bch_tapGestureKey";
static const void *s_bch_longGestureKey = "s_bch_longGestureKey";

@implementation UIView (BCHHelperBlockKit)

#pragma mark - getter
-(UITapGestureRecognizer *)bch_tapGesture
{
    return objc_getAssociatedObject(self, s_bch_tapGestureKey);
}

-(UILongPressGestureRecognizer *)bch_longGesture
{
    return objc_getAssociatedObject(self, s_bch_longGestureKey);
}

#pragma mark - method
-(void)bch_addTapGestureWithCallBack:(BCHTapGestureBlock)onTaped
{
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [self bch_tapGesture];
    tap.bch_onTaped = onTaped;
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self, s_bch_tapGestureKey, onTaped, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)bch_addLongGestureWithCallBack:(BCHLongGestureBlock)onLongPressed
{
    self.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *longGesture = [self bch_longGesture];
    longGesture.bch_onLongPressed = onLongPressed;
    [self addGestureRecognizer:longGesture];
    
    objc_setAssociatedObject(self, s_bch_longGestureKey, onLongPressed, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
