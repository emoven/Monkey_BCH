//
//  UIView+BCHHelperBlockKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHHelperKit.h"

@interface UIView (BCHHelperBlockKit)

@property (nonatomic, strong, readonly)UITapGestureRecognizer *bch_tapGesture;

@property (nonatomic, strong, readonly)UILongPressGestureRecognizer *bch_longGesture;


-(void)bch_addTapGestureWithCallBack:(BCHTapGestureBlock)onTaped;

-(void)bch_addLongGestureWithCallBack:(BCHLongGestureBlock)onLongPressed;


@end
