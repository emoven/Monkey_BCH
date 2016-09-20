//
//  TYQBaseViewController.h
//  TYQProject
//
//  Created by yiliao on 16/5/3.
//  Copyright © 2016年 bch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCHBaseViewController : UIViewController
/** 初始化 navigatioanItems */
- (void)setUpNavigationItemsWithLImg:(UIImage *)lImg lHImg:(UIImage *)lHImg lTxt:(NSString *)lTxt RImg:(UIImage *)rImg rHImg:(UIImage *)rHImg rTxt:(NSString *)rTxt;
- (void)setUpNavigationItemsWithLImg:(UIImage *)lImg lHImg:(UIImage *)lHImg lTxt:(NSString *)lTxt RImg:(UIImage *)rImg rHImg:(UIImage *)rHImg rTxt:(NSString *)rTxt title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize;

/** 导航栏上的按钮响应事件 */
-(void)leftMenuAction:(id)sender;
-(void)rightMenuAction:(id)sender;

/** 初始化导航栏 titleView */
-(void)setUpNavigationTitleViewWithTitle:(NSString *)title;
-(void)setUpNavigationTitleViewWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize;

@end
