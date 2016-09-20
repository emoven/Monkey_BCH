//
//  NSObject+StatusBarShowTips.h
//  TYHomeland
//
//  Created by yiliao on 16/7/27.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDStatusBarNotification.h"


@interface NSObject (showTips)

+ (void)showStatusBarQueryStr:(NSString *)tipStr;
+ (void)showStatusBarSuccessStr:(NSString *)tipStr;
+ (void)showStatusBarErrorStr:(NSString *)errorStr;

/**
 *  自定义状态栏提示样式
 *
 *  @param msg        提示文字
 *  @param styleName  状态栏提示视图唯一标识
 *  @param styleColor 状态栏颜色
 *  @param textColor  提示文字颜色
 *  @param font       提示文字字体
 *  @param animType   动画
 *  @param sec        多久后消失
 */
+(void)showStatusBarMsg:(NSString *)msg
              styleName:(NSString *)styleName
             styleColor:(UIColor *)styleColor
              textColor:(UIColor *)textColor
                   font:(UIFont *)font
               animType:(JDStatusBarAnimationType)animType
           dismissAfter:(int)sec;
+(void)showCusStatusBarMsg:(NSString *)msg
              styleName:(NSString *)styleName;
+(void)showCusStatusBarMsg:(NSString *)msg
                 styleName:(NSString *)styleName
              dismissAfter:(int)sec;


#pragma mark - MBProgress custom
+ (void)showHudTipStr:(NSString *)tipStr;
+ (instancetype)showHUDQueryStr:(NSString *)titleStr;
+ (NSUInteger)hideHUDQuery;

#pragma mark - SVProgressHud custom



@end
