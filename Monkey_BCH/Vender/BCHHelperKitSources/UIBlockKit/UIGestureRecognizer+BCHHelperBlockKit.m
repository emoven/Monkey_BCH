//
//  UIGestureRecognizer+BCHHelperBlockKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIGestureRecognizer+BCHHelperBlockKit.h"
#import <objc/runtime.h>

static const void *s_bch_gestureKey = "s_bch_gestureKey";
static const void *s_bch_tap_gestureKey = "s_bch_tap_gestureKey";
static const void *s_bch_long_gestureKey = "s_bch_long_gestureKey";

@implementation UIGestureRecognizer (BCHHelperBlockKit)

#pragma mark - onGesture
-(BCHGestureBlock)bch_onGesture
{
    return objc_getAssociatedObject(self, s_bch_gestureKey);
}

-(void)setBch_onGesture:(BCHGestureBlock)bch_onGesture
{
    objc_setAssociatedObject(self, s_bch_gestureKey, bch_onGesture, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(bch_private_onGesture:)];
    
    if (bch_onGesture) {
        [self addTarget:self action:@selector(bch_private_onGesture:)];
    }
}

#pragma mark - onTaped
-(BCHTapGestureBlock)bch_onTaped
{
    return objc_getAssociatedObject(self, s_bch_tap_gestureKey);
}

-(void)setBch_onTaped:(BCHTapGestureBlock)bch_onTaped
{
    objc_setAssociatedObject(self, s_bch_tap_gestureKey, bch_onTaped, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(bch_private_onTaped:)];
    
    if (bch_onTaped) {
        [self addTarget:self action:@selector(bch_private_onTaped:)];
    }
}

#pragma mark - onTaped
-(BCHLongGestureBlock)bch_onLongPressed
{
    return objc_getAssociatedObject(self, s_bch_long_gestureKey);
}

-(void)setBch_onLongPressed:(BCHLongGestureBlock)bch_onLongPressed
{
    objc_setAssociatedObject(self, s_bch_long_gestureKey, bch_onLongPressed, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(bch_private_onLongPressed:)];
    
    if (bch_onLongPressed) {
        [self addTarget:self action:@selector(bch_private_onLongPressed:)];
    }
}

#pragma mark - private
-(void)bch_private_onGesture:(UIGestureRecognizer *)sender
{
    BCHGestureBlock block = [self bch_onGesture];
    if (block) {
        block(sender);
    }
}

-(void)bch_private_onTaped:(UITapGestureRecognizer *)sender
{
    BCHTapGestureBlock block = [self bch_onTaped];
    if (block) {
        block(sender);
    }
}

-(void)bch_private_onLongPressed:(UILongPressGestureRecognizer *)sender
{
    BCHLongGestureBlock block = [self bch_onLongPressed];
    if (block) {
        block(sender);
    }
}

@end
