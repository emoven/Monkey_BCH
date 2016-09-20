//
//  MBProgressHUD+BCH.h
//
//  Created by bch on 15-6-6.
//  Copyright (c) 2015年 bch. All rights reserved.
//

#import "MBProgressHUD+BCH.h"

@implementation MBProgressHUD (BCH)

#pragma mark - 显示提示信息,自动隐藏
+ (void)bch_showHudTipStr:(NSString *)tipStr{
    // 快速显示一个提示信息
    [self bch_showHudTipStr:tipStr toView:nil];
}
+ (void)bch_showHudTipStr:(NSString *)tipStr toView:(UIView *)view{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = tipStr;
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 2秒之后再消失
    [hud hideAnimated:YES afterDelay:2.0];
}
+ (void)bch_showHudTipStr:(NSString *)tipStr icon:(NSString *)icon toView:(UIView *)view{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = tipStr;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:2.0];

}

#pragma mark - 显示提示信息,手动隐藏
+ (MBProgressHUD *)bch_showHUDQueryStr:(NSString *)titleStr{
    MBProgressHUD *hud = [self bch_showHUDQueryStr:titleStr toView:nil];
    return hud;
}
+ (MBProgressHUD *)bch_showHUDQueryStr:(NSString *)titleStr toView:(UIView *)view{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = titleStr;
    hud.label.font = [UIFont boldSystemFontOfSize:15.0];
    hud.margin = 10.f;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

#pragma mark 显示成功/错误信息
+ (void)bch_showError:(NSString *)error toView:(UIView *)view{
    [self bch_showHudTipStr:error icon:@"error.png" toView:view];
}
+ (void)bch_showError:(NSString *)error{
    [self bch_showError:error toView:nil];
}
+ (void)bch_showSuccess:(NSString *)success toView:(UIView *)view{
    [self bch_showHudTipStr:success icon:@"success.png" toView:view];
}
+ (void)bch_showSuccess:(NSString *)success{
    [self bch_showSuccess:success toView:nil];
}

#pragma mark - 隐藏提示蒙版
+ (void)bch_hideHUDForView:(UIView *)view{
    [self hideHUDForView:view animated:YES];
}
+ (void)bch_hideHUDQuery{
    [self bch_hideHUD];
}
+ (void)bch_hideHUD{
    [self bch_hideHUDForView:nil];
}

@end
