//
//  UIActionSheet+BCHHelperKitUIKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BCHActionSheetClickedButtonBlock)(UIActionSheet *actionSheet,NSUInteger buttonIndex);

@interface UIActionSheet (BCHHelperKitUIKit)

@property(nonatomic,copy)BCHActionSheetClickedButtonBlock bch_clickedButtonBlock;

+ (instancetype)bch_showInView:(UIView *)inView
                         title:(NSString *)title
                   cancelTitle:(NSString *)cancelTitle
              destructiveTitle:(NSString *)destructiveTitle
                   otherTitles:(NSArray *)otherTitles
                      callback:(BCHActionSheetClickedButtonBlock)callback;

@end
