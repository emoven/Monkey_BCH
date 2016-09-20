//
//  TYQBaseViewController.m
//  TYQProject
//
//  Created by yiliao on 16/5/3.
//  Copyright © 2016年 bch. All rights reserved.
//

#import "BCHBaseViewController.h"
#import "YYFPSLabel.h"
#import "UIBarButtonItem+Extension.h"
#import "AFNetworkReachabilityManager.h"

@interface BCHBaseViewController ()

@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@property (nonatomic, weak) UILabel *netStatusLable;
@property (nonatomic, strong) AFNetworkReachabilityManager *networkReachabilityManager;

@end

@implementation BCHBaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//    self.navigationController.navigationBar.translucent = YES;
//    // 设置导航条的背景图片
//    UIImage *image = [UIColor bch_imageWithColor:kColorNavBarBG];
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    // 隐藏底部阴影条，传递一个空图片的UIImage对象
//    UIImage *shadowImage = [UIColor bch_imageWithColor:[UIColor colorWithWhite:0.0 alpha:0.2]];//[[UIImage alloc]init];
//    [self.navigationController.navigationBar setShadowImage:shadowImage];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//        [HYBNetworking cancelAllRequest];
//        [SVProgressHUD dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kWhiteColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //监听网络
     [self netWorkObserver];
    
    //设置fpsLable
    [self testFPSLabel];
    
}

#pragma mark - 初始化 navigatioanItems
- (void)setUpNavigationItemsWithLImg:(UIImage *)lImg lHImg:(UIImage *)lHImg lTxt:(NSString *)lTxt RImg:(UIImage *)rImg rHImg:(UIImage *)rHImg rTxt:(NSString *)rTxt
{
    [self setUpNavigationItemsWithLImg:lImg lHImg:lHImg lTxt:lTxt RImg:rImg rHImg:rHImg rTxt:rTxt title:nil titleColor:nil fontSize:0];
}

- (void)setUpNavigationItemsWithLImg:(UIImage *)lImg lHImg:(UIImage *)lHImg lTxt:(NSString *)lTxt RImg:(UIImage *)rImg rHImg:(UIImage *)rHImg rTxt:(NSString *)rTxt title:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize{
    //初始化导航栏 左边 BarButtonItem
    if (lTxt) {
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem bch_leftItemWithTarget:self action:@selector(leftMenuAction:) text:lTxt];
        //[UIBarButtonItem itemWithItemName:lTxt target: self action:@selector(leftMenuAction:)];
    }else{
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem bch_leftItemWithTarget:self action:@selector(leftMenuAction:) image:lImg highImage:lHImg];//[UIBarButtonItem itemImage:lImg highImage:lHImg target:self action:@selector(leftMenuAction:)];
    }
    //初始化导航栏 title
    if (title) {
        [self setUpNavigationTitleViewWithTitle:title];
        if (titleColor && fontSize) {
            [self setUpNavigationTitleViewWithTitle:title titleColor:titleColor fontSize:fontSize];
        }
    }
    //初始化导航栏 右边 BarButtonItem
    if(rTxt){
        //初始化导航栏 右边 BarButtonItem
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem bch_rightItemWithTarget:self action:@selector(rightMenuAction:) text:rTxt];
        //[UIBarButtonItem itemWithItemName:rTxt target: self action:@selector(rightMenuAction:)];
    }else{
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem bch_rightItemWithTarget:self action:@selector(rightMenuAction:) image:rImg highImage:rHImg];//[UIBarButtonItem rightItemImage:rImg highImage:rHImg target:self action:@selector(rightMenuAction:)];
    }
    
}

#pragma mark - 导航栏上的按钮响应事件
-(void)leftMenuAction:(id)sender
{
    
}

-(void)rightMenuAction:(id)sender
{
    
}

#pragma mark - 初始化导航栏 titleView
-(void)setUpNavigationTitleViewWithTitle:(NSString *)title
{
    self.navigationItem.title = title;
}

-(void)setUpNavigationTitleViewWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize
{
    self.navigationItem.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : titleColor,
                NSFontAttributeName : kFontWithSize(fontSize)}];
}

#pragma mark - FPS demo
- (void)testFPSLabel {
    _fpsLabel = [YYFPSLabel new];
    _fpsLabel.frame = CGRectMake((kScreenWidth - 50) * 0.5 + 50, 0, 50, 20);
    [_fpsLabel sizeToFit];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:_fpsLabel];
//    [self.view addSubview:_fpsLabel];
    
    // 如果直接用 self 或者 weakSelf，都不能解决循环引用问题
    
    // 移除也不能使 label里的 timer invalidate
    //        [_fpsLabel removeFromSuperview];
}

#pragma mark - 监听网络
- (void)netWorkObserver
{
    //网络检测
    _networkReachabilityManager = [AFNetworkReachabilityManager sharedManager];
    __weak BCHBaseViewController *weakSelf = self;
    [_networkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [weakSelf showNetConnectStatusView:status];
    }];
    [_networkReachabilityManager startMonitoring];
}
//提示网络连接
-(void)showNetConnectStatusView:(AFNetworkReachabilityStatus)status
{
    UILabel *lable = [[UILabel alloc]init];
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:16];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.backgroundColor = [UIColor clearColor];//[UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    lable.width = [UIScreen mainScreen].bounds.size.width;
    lable.height = 35;
    lable.y = 64 - lable.height;
    //把 lable 添加到导航控制器中,并且是盖在导航栏的下边
    [self.navigationController.view insertSubview:lable belowSubview:self.navigationController.navigationBar];
    if (status == AFNetworkReachabilityStatusNotReachable)
    {
        lable.text = @"网络连接失败!";
        lable.backgroundColor = kRedColor;
        [UIView animateWithDuration:0.5 animations:^{
            //如果某个动画,执行完成后又要回到之前的状态,就用 transform 动画
            lable.transform = CGAffineTransformMakeTranslation(0, lable.height);
            self.netStatusLable = lable;
        }];
    }else{
        
        [UIView animateWithDuration:0.5 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.netStatusLable.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self.netStatusLable removeFromSuperview];
        }];
    }
}

@end
