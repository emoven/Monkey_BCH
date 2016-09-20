//
//  UIBarButtonItem+Extension.m
//  Text
//
//  Created by bch on 14-10-7.
//  Copyright (c) 2014年 bch. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

#pragma mark - 导航栏 `纯文字item` 快速创建
+ (instancetype)bch_leftItemWithTarget:(id)target action:(SEL)action text:(NSString *)text{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);//调整右边距
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}
+ (instancetype)bch_rightItemWithTarget:(id)target action:(SEL)action text:(NSString *)text{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
//    button.backgroundColor = kRedColor;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);//调整右边距
//    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

#pragma mark - 导航栏 `纯图片item` 快速创建
+ (instancetype)bch_leftItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    //修改按钮向右偏移10 point
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setFrame:CGRectMake(0, 0, 30, 30)];//由于图片不规则,所以只能设置frame
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = kRedColor;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    //包装button,作用:点击区域确定,就是这个view和button重叠的区域可响应事件
//    UIView *view = [[UIView alloc] initWithFrame:button.bounds];
//    view.backgroundColor = kBlueColor;
//    [view addSubview:button];//
    return [[self alloc] initWithCustomView:button];
}
+ (instancetype)bch_rightItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    //修改按钮向右偏移10 point
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setFrame:CGRectMake(5, 5, 23, 20)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //修改方法
    UIView *view = [[UIView alloc] initWithFrame:button.bounds];
    [view addSubview:button];
    return [[self alloc] initWithCustomView:view];
}

#pragma mark - 导航栏 `文字图片都有item` 快速创建
+ (instancetype)bch_leftItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage text:(NSString *)text{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:text forState:UIControlStateNormal];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

+ (instancetype)bch_rightItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage text:(NSString *)text{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:text forState:UIControlStateNormal];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

#pragma mark - 导航栏 `特殊定制` 快速创建
+ (instancetype)bch_searchVCBackItemWithTarget:(id)target action:(SEL)action image:(id)image highImage:(id)highImage{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    //不变形
    button.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [button setFrame:CGRectMake(0, 0, 20, 30)];//由于图片不规则,所以只能设置frame
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = kRedColor;
//    button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, -10);
    return [[self alloc] initWithCustomView:button];
}

@end
