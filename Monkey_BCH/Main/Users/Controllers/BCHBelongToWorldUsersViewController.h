//
//  BCHBelongToWorldUsersViewController.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHBaseViewController.h"
@class BCHBelongToWorldUsersViewController;

typedef void(^BelongToWorldUsersBlock)(BCHBelongToWorldUsersViewController *vc,NSInteger totalCount);

@interface BCHBelongToWorldUsersViewController : BCHBaseViewController

@property (nonatomic,copy) NSString *language; 

@property (nonatomic,strong) BelongToWorldUsersBlock belongToWorldUsersBlock;

@end
