//
//  BCHLoginWebViewController.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHBaseViewController.h"
@class BCHLoginWebViewController;

typedef void(^LoginWebVCBlock)(BCHLoginWebViewController *vc, NSString *status);

@interface BCHLoginWebViewController : BCHBaseViewController
@property (nonatomic,strong)NSString *navTitle;
@property (nonatomic,strong) NSString *urlString;
@property (nonatomic,strong) LoginWebVCBlock loginWebVCBlock;
@end
