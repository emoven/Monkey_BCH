//
//  UITextField+BCHMasonryKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHHelperBlockKit.h"

@interface UITextField (BCHMasonryKit)

/** 光标左间距 */
@property (nonatomic,assign)CGFloat bch_leftMarginOfCursor;

+(instancetype)bch_textFiledWithHolder:(NSString *)holder
                             superView:(UIView *)superView
                           constraints:(BCHConstraintMaker)constraints;

+(UITextField *)bch_textFiledWithHolder:(NSString *)holder
                               delegate:(id<UITextFieldDelegate>)delegate
                              superView:(UIView *)superView
                            constraints:(BCHConstraintMaker)constraints;

+(UITextField *)bch_textFiledWithHolder:(NSString *)holder
                               text:(NSString *)text
                              superView:(UIView *)superView
                            constraints:(BCHConstraintMaker)constraints;

+(UITextField *)bch_textFiledWithHolder:(NSString *)holder
                                   text:(NSString *)text
                               delegate:(id<UITextFieldDelegate>)delegate
                              superView:(UIView *)superView
                            constraints:(BCHConstraintMaker)constraints;
@end
