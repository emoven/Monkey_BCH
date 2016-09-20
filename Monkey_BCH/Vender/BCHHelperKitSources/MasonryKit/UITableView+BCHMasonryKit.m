//
//  UITableView+BCHMasonryKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UITableView+BCHMasonryKit.h"

@implementation UITableView (BCHMasonryKit)

+(instancetype)bch_tableViewWithSuperView:(UIView *)superView
{
    return [self bch_tableViewWithSuperView:superView delegate:nil
                                constraints:^(MASConstraintMaker *make) {
        if (superView) {
            make.edges.mas_equalTo(superView);
        }
    }];
}

+(instancetype)bch_tableViewWithSuperView:(UIView *)superView
                              constraints:(BCHConstraintMaker)constraints
{
    return [self bch_tableViewWithSuperView:superView
                                   delegate:nil
                                constraints:constraints];
}

+(instancetype)bch_tableViewWithSuperView:(UIView *)superView
                                 delegate:(id)delegate
{
    return [self bch_tableViewWithSuperView:superView
                                   delegate:delegate
                                constraints:^(MASConstraintMaker *make) {
        if (superView) {
            make.edges.mas_equalTo(superView);
        }
    }];
}

+(instancetype)bch_tableViewWithSuperView:(UIView *)superView
                                 delegate:(id)delegate
                              constraints:(BCHConstraintMaker)constraints
{
    return [self bch_tableViewWithSuperview:superView
                                   delegate:delegate
                                      style:UITableViewStylePlain
                                constraints:constraints];

}

+(instancetype)bch_tableViewWithSuperview:(UIView *)superView
                                 delegate:(id)delegate
                                    style:(UITableViewStyle)style
                              constraints:(BCHConstraintMaker)constraints
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [superView addSubview:tableView];
    
    if (superView && constraints) {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    
    return tableView;
}


@end
