//
//  UIControl+BCHHelperBlockKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/18.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIControl+BCHHelperBlockKit.h"
#import <objc/runtime.h>

static const void *s_BCHButtonTouchUpKey = "s_BCHButtonTouchUpKey";
static const void *s_BCHButtonTouchDownKey = "s_BCHButtonTouchDownKey";
static const void *s_BCHButtonOnValueChangedKey = "s_BCHButtonOnValueChangedKey";
static const void *s_BCHButtonOnEditChangedKey = "s_BCHButtonOnEditChangedKey";


@implementation UIControl (BCHHelperBlockKit)

#pragma mark - touchUpInside
-(BCHButtonBlock)bch_onTouchUp
{
    /**
     *  根据关联的key，获取关联的值
     *
     *  @param self  关联的对象
     *  @param key 关联的key
     */
    return objc_getAssociatedObject(self, s_BCHButtonTouchUpKey);
}

-(void)setBch_onTouchUp:(BCHButtonBlock)bch_onTouchUp
{
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    objc_setAssociatedObject(self, s_BCHButtonTouchUpKey, bch_onTouchUp, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(bch_private_onTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    
    if (bch_onTouchUp) {
        [self addTarget:self action:@selector(bch_private_onTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - touchDown
-(BCHButtonBlock)bch_onTouchDown
{
    return objc_getAssociatedObject(self, s_BCHButtonTouchDownKey);
}

-(void)setBch_onTouchDown:(BCHButtonBlock)bch_onTouchDown
{
    objc_setAssociatedObject(self, s_BCHButtonTouchDownKey, bch_onTouchDown, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(bch_private_onTouchDown:) forControlEvents:UIControlEventTouchDown];
    
    if (bch_onTouchDown) {
        [self addTarget:self action:@selector(bch_private_onTouchDown:) forControlEvents:UIControlEventTouchDown];
    }
}

#pragma mark - valueChanged
-(BCHValueChangedBlock)bch_onValueChanged
{
    return objc_getAssociatedObject(self, s_BCHButtonOnValueChangedKey);
}

-(void)setBch_onValueChanged:(BCHValueChangedBlock)bch_onValueChanged
{
    objc_setAssociatedObject(self, s_BCHButtonOnValueChangedKey, bch_onValueChanged, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(bch_private_onValueChanged:) forControlEvents:UIControlEventTouchDown];
    
    if (bch_onValueChanged) {
        [self addTarget:self action:@selector(bch_private_onValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark - editChanged
-(BCHEditChangedBlock)bch_onEditChanged
{
    return objc_getAssociatedObject(self, s_BCHButtonOnEditChangedKey);
}

-(void)setBch_onEditChanged:(BCHEditChangedBlock)bch_onEditChanged
{
    objc_setAssociatedObject(self, s_BCHButtonOnEditChangedKey, bch_onEditChanged, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(bch_private_onEditChanged:) forControlEvents:UIControlEventTouchDown];
    
    if (bch_onEditChanged) {
        [self addTarget:self action:@selector(bch_private_onEditChanged:) forControlEvents:UIControlEventEditingChanged];
    }
}

#pragma mark - Private
-(void)bch_private_onTouchUp:(id) sender
{
    BCHButtonBlock block = [self bch_onTouchUp];
    if (block) {
        block(sender);
    }
}

-(void)bch_private_onTouchDown:(id) sender
{
    BCHButtonBlock block = [self bch_onTouchDown];
    if (block) {
        block(sender);
    }
}

-(void)bch_private_onValueChanged:(id)sender
{
    BCHValueChangedBlock block = [self bch_onValueChanged];
    if (block) {
        block(sender);
    }
}

-(void)bch_private_onEditChanged:(id)sender
{
    BCHEditChangedBlock block = [self bch_onEditChanged];
    if (block) {
        block(sender);
    }
}


@end
