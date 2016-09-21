//
//  BCHLoginWebViewController.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHLoginWebViewController.h"
#import <WebKit/WebKit.h>
#import "NSString+BCHHelperKit.h"
#import "UIBarButtonItem+Extension.h"
#import "AFHTTPSessionManager.h"
@interface BCHLoginWebViewController ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong) NSMutableDictionary *postDict;
@property (nonatomic,strong) WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UINavigationItem *customNavigationItem;
@property (weak, nonatomic) IBOutlet UINavigationBar *customNavigationBar;

 

@end

@implementation BCHLoginWebViewController
#pragma mark – Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    
    [self.contentView addSubview:self.webView];
    
    [self loadWebView];
    
    [self addKVO];
}

-(void)dealloc{
//    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
//    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Events
-(void)leftMenuAction:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark – Private Methods
-(void)setUpNav{
    self.customNavigationItem.leftBarButtonItem = [UIBarButtonItem bch_leftItemWithTarget:self action:@selector(leftMenuAction:) image:[[UIImage imageNamed:@"btBack"]imageWithTintColor:kWhiteColor] highImage:nil];
    self.customNavigationItem.title = self.navTitle;
    [self.customNavigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : kWhiteColor,              NSFontAttributeName : kFontWithSize(20)}];
}
-(void)loadWebView{
    NSURL *url = [NSURL URLWithString:[NSString bch_checkString:self.urlString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

-(void)addKVO{
    //KVO注意点:一点要记得删除
//    [self.webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
//    [self.webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)loginTokenAction:(NSString *)code{
    NSMutableDictionary *postDict = [NSMutableDictionary dictionary];
    [postDict setValue:@"8b5497250a9c86697dd8" forKey:@"client_id"];
    [postDict setValue:@"2982ec02fbad11faf57511a193e2863457f3f042" forKey:@"client_secret"];
    [postDict setValue:code forKey:@"code"];
    [postDict setValue:@"1992" forKey:@"state"];
    [postDict setValue:@"https://github.com/Baichenghui/Monkey_BCH" forKey:@"redirect_uri"];
    self.postDict = postDict;
    
    [NSObject showHUDQueryStr:@"login ..."];
    kWeak(weakSelf, self);
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//特别注意,这里返回的数据不是json
    [manager POST:@"https:github.com/login/oauth/access_token/" parameters:postDict progress:nil success:^(NSURLSessionDataTask * task, id responseObject) {
        [NSObject hideHUDQuery];
        if (self.postDict != postDict) return;
        NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        for (int i=0; i<result.length-13; i++) {
            if ([[result substringWithRange:NSMakeRange(i, 13)] isEqualToString:@"access_token="]) {
                NSString *token=[result substringWithRange:NSMakeRange(i+13, 40)];
                kUserDefaultSetObjectForKey(token, kAccess_tokenKey);
                if (_loginWebVCBlock) {
                    _loginWebVCBlock(self,NSLocalizedString(@"success", @""));
                }
                [self dismissViewControllerAnimated:YES completion:nil];
                return ;
            }
        }
        TYLog(@"%@",result);
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        if (weakSelf.postDict != postDict) return;
        [NSObject hideHUDQuery];
        [SVProgressHUD showHudTipStr:@"网络有误,请稍后再试!"];
        TYLog(@"error:%@",error);
    }];

}



#pragma mark - KVO监听
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//    self.leftBarItem.enabled = self.webView.canGoBack;
//    self.rightBarItem.enabled = self.webView.canGoForward;
    self.customNavigationItem.title = self.webView.title;
    self.progressBar.progress = self.webView.estimatedProgress;
    self.progressBar.hidden = self.webView.estimatedProgress >= 1;
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    [NSObject showHUDQueryStr:NSLocalizedString(@"loading", @"")];
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [NSObject hideHUDQuery];
    
    //https://github.com/Baichenghui/Monkey_BCH?code=08ebe7c55b4661ff0960&state=1992
    NSString *requestUrl = webView.URL.absoluteString;
    for (int i=0; i<requestUrl.length-5; i++) {
        if ([[requestUrl substringWithRange:NSMakeRange(i, 5)] isEqualToString:@"code="]) {
            [self loginTokenAction:[requestUrl substringWithRange:NSMakeRange(i+5, 20)]];
            return;
        }
    }
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    [NSObject hideHUDQuery];
    [NSObject showHudTipStr:NSLocalizedString(@"noNetwork", @"")];
}

#pragma mark - Custom Delegates

#pragma mark – Getters and Setters
-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]init];
        _webView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.backgroundColor = kOrangeColor;
    }
    return _webView;
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
