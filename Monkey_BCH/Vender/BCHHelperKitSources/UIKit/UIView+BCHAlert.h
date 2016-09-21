//
//  UIView+BCHAlert.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BCHAlertBlock)(id sender,NSUInteger buttonIndex);

@interface UIView (BCHAlert)

@property (nonatomic,strong) BCHAlertBlock bch_alertBlock; 

+(void)bch_showWithTitle:(NSString *)title
                         message:(NSString *)message
                    buttonTitles:(NSArray *)buttonTitles 
                           callback:(BCHAlertBlock)callback;

@end
