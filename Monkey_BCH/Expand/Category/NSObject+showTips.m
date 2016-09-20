//
//  NSObject+StatusBarShowTips.m
//  TYHomeland
//
//  Created by yiliao on 16/7/27.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "NSObject+showTips.h"
#define kHUDQueryViewTag 101

@implementation NSObject (showTips)

+ (void)showStatusBarQueryStr:(NSString *)tipStr{
    [JDStatusBarNotification showWithStatus:tipStr styleName:JDStatusBarStyleSuccess];
    [JDStatusBarNotification showActivityIndicator:YES indicatorStyle:UIActivityIndicatorViewStyleWhite];
}

+ (void)showStatusBarSuccessStr:(NSString *)tipStr{
    if ([JDStatusBarNotification isVisible]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
            [JDStatusBarNotification showWithStatus:tipStr dismissAfter:1.5 styleName:JDStatusBarStyleSuccess];
        });
    }else{
        [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
        [JDStatusBarNotification showWithStatus:tipStr dismissAfter:1.0 styleName:JDStatusBarStyleSuccess];
    }
}

+ (void)showStatusBarErrorStr:(NSString *)errorStr{
    if ([JDStatusBarNotification isVisible]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
            [JDStatusBarNotification showWithStatus:errorStr dismissAfter:1.5 styleName:JDStatusBarStyleError];
        });
    }else{
        [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
        [JDStatusBarNotification showWithStatus:errorStr dismissAfter:1.5 styleName:JDStatusBarStyleError];
    }
}

+(void)showCusStatusBarMsg:(NSString *)msg
              styleName:(NSString *)styleName{
    [JDStatusBarNotification showActivityIndicator:YES indicatorStyle:UIActivityIndicatorViewStyleWhite];
    [JDStatusBarNotification addStyleNamed:styleName
                                   prepare:^JDStatusBarStyle*(JDStatusBarStyle *style) {
                                       
                                       // main properties
                                       //bar的背景色
                                       style.barColor = BCHMainColor;
                                       //文字颜色
                                       style.textColor = [UIColor whiteColor];
                                       //字体设置
                                       style.font = [UIFont systemFontOfSize:15.0];
                                       
                                       // advanced properties
                                       //
                                       style.animationType = JDStatusBarAnimationTypeBounce;
                                       //设置文字阴影                                       style.textShadow = <#shadow#>;
                                       
                                       //垂直方向文字间距
                                       style.textVerticalPositionAdjustment = 0.0;
                                       
                                       return style;
                                   }];
    
    [JDStatusBarNotification showWithStatus:msg styleName:styleName];
    
}

+(void)showCusStatusBarMsg:(NSString *)msg
              styleName:(NSString *)styleName
           dismissAfter:(int)sec{
    [JDStatusBarNotification showActivityIndicator:YES indicatorStyle:UIActivityIndicatorViewStyleWhite];
    [JDStatusBarNotification addStyleNamed:styleName
                                   prepare:^JDStatusBarStyle*(JDStatusBarStyle *style) {
                                       
                                       // main properties
                                       //bar的背景色
                                       style.barColor = kRedColor;
                                       //文字颜色
                                       style.textColor = [UIColor whiteColor];
                                       //字体设置
                                       style.font = [UIFont systemFontOfSize:15.0];
                                       
                                       // advanced properties
                                       //
                                       style.animationType = JDStatusBarAnimationTypeBounce;
                                       //设置文字阴影                                       style.textShadow = <#shadow#>;
                                       
                                       //垂直方向文字间距
                                       style.textVerticalPositionAdjustment = 0.0;
                                       
                                       return style;
                                   }];
    
    [JDStatusBarNotification showWithStatus:msg dismissAfter:sec styleName:styleName];
    
}


+(void)showStatusBarMsg:(NSString *)msg
              styleName:(NSString *)styleName
             styleColor:(UIColor *)styleColor
              textColor:(UIColor *)textColor
                   font:(UIFont *)font
               animType:(JDStatusBarAnimationType)animType
           dismissAfter:(int)sec {
   [JDStatusBarNotification addStyleNamed:styleName
                                   prepare:^JDStatusBarStyle*(JDStatusBarStyle *style) {
                                       
                                       // main properties
                                       //bar的背景色
                                       style.barColor = styleColor;
                                       //文字颜色
                                       style.textColor = textColor;
                                       //字体设置
                                       style.font = font;
                                       
                                       // advanced properties
                                       //
                                       style.animationType = animType;
                                       
                                       //垂直方向文字间距
                                       style.textVerticalPositionAdjustment = 0.0;
                                       
                                       return style;
                                   }];

    [JDStatusBarNotification showWithStatus:msg dismissAfter:sec styleName:styleName];
    
}

#pragma mark - MBProgressHud custom
+ (void)showHudTipStr:(NSString *)tipStr{
    if (tipStr && tipStr.length > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.font = [UIFont boldSystemFontOfSize:15.0];
        hud.detailsLabel.text = tipStr;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:2.0];
    }
}

+ (instancetype)showHUDQueryStr:(NSString *)titleStr{
    titleStr = titleStr.length > 0? titleStr: @"正在获取数据...";
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
    hud.tag = kHUDQueryViewTag;
    hud.label.text = titleStr;
    hud.label.font = [UIFont boldSystemFontOfSize:15.0];
    hud.margin = 10.f;
    return hud;
}

+ (NSUInteger)hideHUDQuery{
    __block NSUInteger count = 0;
    NSArray *huds = [MBProgressHUD allHUDsForView:kKeyWindow];
    [huds enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if (obj.tag == kHUDQueryViewTag) {
            [obj removeFromSuperview];
            count++;
        }
    }];
    return count;
}



@end
