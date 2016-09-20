//
//  MBProgressHUD+BCH.h
//
//  Created by bch on 15-6-6.
//  Copyright (c) 2015年 bch. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (BCH)

/** 显示提示信息,自动隐藏 */
+ (void)bch_showHudTipStr:(NSString *)tipStr;
+ (void)bch_showHudTipStr:(NSString *)tipStr toView:(UIView *)view;
+ (void)bch_showHudTipStr:(NSString *)tipStr icon:(NSString *)icon toView:(UIView *)view;

/** 显示提示信息,手动隐藏 */
+ (MBProgressHUD *)bch_showHUDQueryStr:(NSString *)titleStr;
+ (MBProgressHUD *)bch_showHUDQueryStr:(NSString *)titleStr toView:(UIView *)view;

/** 隐藏 */
+ (void)bch_hideHUDForView:(UIView *)view;
+ (void)bch_hideHUDQuery;
+ (void)bch_hideHUD;

/** 提示成功 / 失败 */
+ (void)bch_showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)bch_showError:(NSString *)error toView:(UIView *)view;
+ (void)bch_showSuccess:(NSString *)success;
+ (void)bch_showError:(NSString *)error;

@end
