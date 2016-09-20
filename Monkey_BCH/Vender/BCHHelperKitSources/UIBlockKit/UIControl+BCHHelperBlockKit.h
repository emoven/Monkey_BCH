//
//  UIControl+BCHHelperBlockKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/18.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHCommonKit.h"

@interface UIControl (BCHHelperBlockKit)

@property (nonatomic,copy) BCHButtonBlock bch_onTouchUp;

@property (nonatomic,copy) BCHButtonBlock bch_onTouchDown;

@property (nonatomic,copy) BCHValueChangedBlock bch_onValueChanged;

@property (nonatomic,copy) BCHEditChangedBlock bch_onEditChanged;

@end
