//
//  TYMainTabBarViewController.m
//  TYHomeland
//
//  Created by yiliao on 16/9/5.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHMainTabBarViewController.h"
#import "BCHBaseNavigationViewController.h"

#import "BCHUsersViewController.h"
#import "BCHRepositoriesViewController.h"
#import "BCHDiscoveryViewController.h"
#import "BCHMoreViewController.h"



@interface BCHMainTabBarViewController ()

@end

@implementation BCHMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUiChildViewControllers];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUiChildViewControllers{
    [self addChrildWithVCtrl:[[BCHUsersViewController alloc] init] Title:NSLocalizedString(@"Users", @"a title on tabbarItem") image:@"github60" selectedImage:@"github60"];
    [self addChrildWithVCtrl:[[BCHRepositoriesViewController alloc] init] Title:NSLocalizedString(@"Repositories", @"a title on tabbarItem") image:@"github160" selectedImage:@"github160"];
    
    [self addChrildWithVCtrl:[[BCHDiscoveryViewController alloc] init] Title:NSLocalizedString(@"Discovery", @"a title on tabbarItem") image:@"github60" selectedImage:@"github60"];
    [self addChrildWithVCtrl:[[BCHMoreViewController alloc] init] Title:NSLocalizedString(@"More", @"a title on tabbarItem") image:@"more" selectedImage:@"more"];
}

 
- (void)addChrildWithVCtrl:(UIViewController *)vCtrl Title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //同时设置tabBarItem和navigationItem的title
    vCtrl.title = title;
    
    //普通状态和高亮状态显示图片
    vCtrl.tabBarItem.image = [[[UIImage imageNamed:image]imageWithTintColor:kLightGrayColor]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vCtrl.tabBarItem.selectedImage = [[[UIImage imageNamed:image]imageWithTintColor:BCHMainColor]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
     
    //普通状态和高亮状态文字样式
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:12];
    NSMutableDictionary *selectedAttributes = [NSMutableDictionary dictionary];
    selectedAttributes[NSForegroundColorAttributeName] = BCHMainColor;
    [vCtrl.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [vCtrl.tabBarItem setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    
    //添加自定义导航控制器
    BCHBaseNavigationViewController *navCtrl = [[BCHBaseNavigationViewController alloc] initWithRootViewController:vCtrl];
    
    [self addChildViewController:navCtrl];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
 
@end
