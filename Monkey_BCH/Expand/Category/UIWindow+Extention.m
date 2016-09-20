//
//  UIWindow+Extention.m
//  新浪微博
//
//  Created by bch on 16/1/14.
//  Copyright (c) 2016年 bch. All rights reserved.
//

#import "UIWindow+Extention.h"

@implementation UIWindow (Extention)

-(void)switchRootViewController
{
    NSString *key = @"CFBundleVersion";
    //上一个版本号信息
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults]valueForKey:key];
    
    //当前版本号信息(info.plist 获得)
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    //存储当前版本号
    [[NSUserDefaults standardUserDefaults]setValue:currentVersion forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    //根控制器
    //   [[CHTabBarController alloc]init];
    if ([currentVersion isEqualToString:lastVersion])
    {
//        self.rootViewController = [[CHTabBarController alloc]init];
    }else
    {
//        self.rootViewController = [[CHNewFeatureController alloc]init];
    }
}

@end
