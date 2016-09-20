//
//  BCHBelongToChinaUsersViewController.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHBaseViewController.h"
@class BCHBelongToChinaUsersViewController;

typedef void(^BelongToChinaUsersBlock)(BCHBelongToChinaUsersViewController *vc,NSInteger totalCount);

@interface BCHBelongToChinaUsersViewController : BCHBaseViewController

@property (nonatomic,copy) NSString *language;
@property (nonatomic,copy) NSString *location;

@property (nonatomic,strong) BelongToChinaUsersBlock belongToChinaUsersBlock;

@end
