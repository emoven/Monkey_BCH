//
//  TYBaseNavigationViewController.m
//  TYHomeland
//
//  Created by yiliao on 16/7/27.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHBaseNavigationViewController.h"
@interface BCHBaseNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BCHBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置 nav bar 背景色为黑色
//    self.navigationBar.barTintColor = [UIColor redColor];
//    [self.navigationBar setTintColor:BCHMainColor];
//    //普通状态和高亮状态文字样式
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
//    [self.navigationBar setTitleTextAttributes:attributes];
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

 


@end
