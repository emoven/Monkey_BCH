//
//  UIWebView+BCHMasonryKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIWebView+BCHMasonryKit.h"

@implementation UIWebView (BCHMasonryKit)

+(instancetype)bch_webViewWithDelegate:(id)delegate
{
    return [self bch_webViewWithDelegate:delegate superView:nil constraints:nil];
}

+(instancetype)bch_webViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
{
    return [self bch_webViewWithDelegate:delegate superView:superView constraints:nil];
}

+(instancetype)bch_webViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
                                 edges:(UIEdgeInsets)edges
{
    return [self bch_webViewWithDelegate:delegate superView:superView constraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(superView).insets(edges);
    }];
}

+(instancetype)bch_webViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
                           constraints:(BCHConstraintMaker)constraints
{
    UIWebView *webView = [[UIWebView alloc] init];
    
    // 自适应屏幕大小进行缩放
    webView.userInteractionEnabled = YES;
    webView.delegate = delegate;
    webView.scalesPageToFit = YES;
    webView.scrollView.showsVerticalScrollIndicator = NO;
    [superView addSubview:webView];
    
    if (superView) {
        if (constraints) {
            [webView mas_makeConstraints:^(MASConstraintMaker *make) {
                constraints(make);
            }];
        } else {
            [webView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(superView);
            }];
        }
    }
    
    return webView;

}

@end
