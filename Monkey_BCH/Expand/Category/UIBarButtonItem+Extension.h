//
//  UIBarButtonItem+Extension.h
//  Text
//
//  Created by bch on 14-10-7.
//  Copyright (c) 2014年 bch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

#pragma mark - 导航栏 `纯文字item` 快速创建
+ (instancetype)bch_leftItemWithTarget:(id)target action:(SEL)action text:(NSString *)text;
+ (instancetype)bch_rightItemWithTarget:(id)target action:(SEL)action text:(NSString *)text;

#pragma mark - 导航栏 `纯图片item` 快速创建
+ (instancetype)bch_leftItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage;
+ (instancetype)bch_rightItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage;

#pragma mark - 导航栏 `文字图片都有item` 快速创建
+ (instancetype)bch_leftItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage text:(NSString *)text;
+ (instancetype)bch_rightItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage text:(NSString *)text;

#pragma mark - 导航栏 `特殊定制` 快速创建
+ (instancetype)bch_searchVCBackItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage;

@end
