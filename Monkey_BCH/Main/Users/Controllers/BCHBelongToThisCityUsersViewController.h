//
//  BCHBelongToThisCityUsersViewController.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHBaseViewController.h"
@class BCHBelongToThisCityUsersViewController;

typedef void(^BelongToThisCityUsersBlock)(BCHBelongToThisCityUsersViewController *vc,NSInteger totalCount);

@interface BCHBelongToThisCityUsersViewController : BCHBaseViewController

@property (nonatomic,copy) NSString *language;
@property (nonatomic,copy) NSString *location;

@property (nonatomic,strong) BelongToThisCityUsersBlock belongToThisCityUsersBlock;
@end
