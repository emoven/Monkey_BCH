//
//  UIWebView+BCHMasonryKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHHelperKit.h"

@interface UIWebView (BCHMasonryKit)

+(instancetype)bch_webViewWithDelegate:(id)delegate;

+(instancetype)bch_webViewWithDelegate:(id)delegate
                             superView:(UIView *)superView;

+(instancetype)bch_webViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
                                 edges:(UIEdgeInsets)edges;

+(instancetype)bch_webViewWithDelegate:(id)delegate
                             superView:(UIView *)superView
                           constraints:(BCHConstraintMaker)constraints;

@end
