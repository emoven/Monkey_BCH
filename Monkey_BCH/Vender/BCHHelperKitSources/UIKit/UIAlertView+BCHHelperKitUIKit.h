//
//  UIAlertView+BCHHelperKitUIKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BCHAlertClickedButtonBlock)(UIAlertView *alertView,NSUInteger buttonIndex);

@interface UIAlertView (BCHHelperKitUIKit)

@property (nonatomic, copy) BCHAlertClickedButtonBlock bch_clickedButtonBlock;

+(instancetype)bch_showWithTitle:(NSString *)title
                         message:(NSString *)message
                    buttonTitles:(NSArray *)buttonTitles
                           block:(BCHAlertClickedButtonBlock)block;

@end
