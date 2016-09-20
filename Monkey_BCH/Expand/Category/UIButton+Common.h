//
//  UIButton+Common.h
//  Coding_iOS
//
//  Created by 王 原闯 on 14-8-5.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Common)

+ (UIButton *)bch_buttonWithUserStyle;

+ (UIButton *)tweetBtnWithFrame:(CGRect)frame alignmentLeft:(BOOL)alignmentLeft;

- (void)setUserTitle:(NSString *)aUserName font:(UIFont *)font maxWidth:(CGFloat)maxWidth;

- (void)animateToImage:(NSString *)imageName;

-(void)bch_animateToImage:(NSString *)imageName;
@end
