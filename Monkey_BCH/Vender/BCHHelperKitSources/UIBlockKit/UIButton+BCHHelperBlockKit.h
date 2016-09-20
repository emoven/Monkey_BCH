//
//  UIButton+BCHHelperBlockKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/18.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHCommonKit.h"
#import "BCHHelperKit.h"

@interface UIButton (BCHHelperBlockKit)

+(instancetype)bch_buttonWithTouchUp:(BCHButtonBlock) onTouchUp;

+(instancetype)bch_buttonWithSuperView:(UIView *)superView
                           constraints:(BCHConstraintMaker)constraints touchUp:(BCHButtonBlock)touchUp;

+(instancetype)bch_buttonWithTitle:(NSString *)title
                         superView:(UIView *)superView
                       constraints:(BCHConstraintMaker)constraints touchUp:(BCHButtonBlock)touchUp;

+(instancetype)bch_buttonWithImage:(id)image
                         superView:(UIView *)superView
                       constraints:(BCHConstraintMaker)constraints touchUp:(BCHButtonBlock)touchUp;

+(instancetype)bch_buttonWithImage:(id)image
                       selectImage:(id)selectImage
                         superView:(UIView *)superView
                       constraints:(BCHConstraintMaker)constraints touchUp:(BCHButtonBlock)touchUp;

@end
