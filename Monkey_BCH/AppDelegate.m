//
//  AppDelegate.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/19.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "AppDelegate.h"
#import "BCHMainTabBarViewController.h"
#import "BCHBaseNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setUpNetWorkTool];
    [self setUpRootViewController];
    [self customAppearanceInterface];
     
    return YES;
}

-(void)setUpNetWorkTool
{
    [HYBNetworking updateBaseUrl:@"https://api.github.com/"];
 
    [HYBNetworking enableInterfaceDebug:YES];
    [HYBNetworking setTimeout:15.f];
    // 配置请求和响应类型，由于部分伙伴们的服务器不接收JSON传过去，现在默认值改成了plainText
    [HYBNetworking configRequestType:kHYBRequestTypePlainText
                        responseType:kHYBResponseTypeJSON
                 shouldAutoEncodeUrl:YES
             callbackOnCancelRequest:NO];
}

-(void)setUpRootViewController{
    // 设置主窗口,并设置根控制器
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    BCHMainTabBarViewController *mainTabBarVC = [[BCHMainTabBarViewController alloc]init];
    [self.window setRootViewController:mainTabBarVC];
    [self.window makeKeyAndVisible];
}

- (void)customAppearanceInterface {
    //bch:设置Nav的背景色和title色
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBarTintColor:BCHMainColor];
    [navigationBarAppearance setTintColor:kWhiteColor];//返回按钮的箭头颜色
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName:kFontWithSize(20),
                                     NSForegroundColorAttributeName: kWhiteColor,
                                     };
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    
    [[UITextField appearance] setTintColor:BCHMainColor];
    [[UITextView appearance] setTintColor:BCHMainColor];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
