//
//  UIScrollView+BCHMasonryKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIScrollView+BCHMasonryKit.h"

@implementation UIScrollView (BCHMasonryKit)

+(instancetype)bch_scrollViewWithDelegate:(id)delegate
{
    return [self bch_scrollViewWithDelegate:delegate superView:nil];
}

+(instancetype)bch_scrollViewWithDelegate:(id)delegate
                                superView:(UIView *)superView
{
    if (superView == nil) {
        return [self bch_scrollViewWithDelegate:delegate superView:superView constraints:nil];
    }
    return [self bch_scrollViewWithDelegate:delegate superView:superView constraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(superView);
    }];
}

+(instancetype)bch_scrollViewWithDelegate:(id)delegate
                                superView:(UIView *)superView
                              constraints:(BCHConstraintMaker)constraints
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [superView addSubview:scrollView];
    
    if (superView && constraints) {
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    
    scrollView.delegate = delegate;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    
    return scrollView;
}

@end
