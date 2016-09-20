//
//  UITableView+BCHMasonryKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHCommonKit.h"
#import "BCHHelperBlockKit.h"

@interface UITableView (BCHMasonryKit)

+(instancetype)bch_tableViewWithSuperView:(UIView *)superView;

+(instancetype)bch_tableViewWithSuperView:(UIView *)superView
                              constraints:(BCHConstraintMaker)constraints;

+(instancetype)bch_tableViewWithSuperView:(UIView *)superView
                                 delegate:(id)delegate;

+(instancetype)bch_tableViewWithSuperView:(UIView *)superView
                                 delegate:(id)delegate
                              constraints:(BCHConstraintMaker)constraints;

+(instancetype)bch_tableViewWithSuperview:(UIView *)superView
                                 delegate:(id)delegate
                                    style:(UITableViewStyle)style
                              constraints:(BCHConstraintMaker)constraints;

@end
