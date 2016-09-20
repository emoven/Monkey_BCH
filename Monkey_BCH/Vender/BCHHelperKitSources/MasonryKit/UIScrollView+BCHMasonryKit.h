//
//  UIScrollView+BCHMasonryKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHHelperKit.h"

@interface UIScrollView (BCHMasonryKit)

+(instancetype)bch_scrollViewWithDelegate:(id)delegate;

+(instancetype)bch_scrollViewWithDelegate:(id)delegate
                                superView:(UIView *)superView;

+(instancetype)bch_scrollViewWithDelegate:(id)delegate
                                superView:(UIView *)superView
                              constraints:(BCHConstraintMaker)constraints;

@end
