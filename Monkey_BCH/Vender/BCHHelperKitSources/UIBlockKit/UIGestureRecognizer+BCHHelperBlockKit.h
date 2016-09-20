//
//  UIGestureRecognizer+BCHHelperBlockKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHCommonKit.h"

@interface UIGestureRecognizer (BCHHelperBlockKit)

@property (nonatomic, copy) BCHGestureBlock bch_onGesture;

@property (nonatomic, copy) BCHTapGestureBlock bch_onTaped;

@property (nonatomic, copy) BCHLongGestureBlock bch_onLongPressed;

@end
