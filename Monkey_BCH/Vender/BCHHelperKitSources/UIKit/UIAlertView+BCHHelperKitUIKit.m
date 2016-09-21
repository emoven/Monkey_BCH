//
//  UIAlertView+BCHHelperKitUIKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIAlertView+BCHHelperKitUIKit.h"
#import <objc/runtime.h>
#import "BCHCommonKit.h"
#import "NSArray+BCHHelperKit.h"

static const void *s_bch_privateAlertViewKey = "s_bch_privateAlertViewKey";


@interface UIApplication (HDFAlertView) <UIAlertViewDelegate>

@end

@implementation UIApplication (HDFAlertView)

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.bch_clickedButtonBlock) {
        alertView.bch_clickedButtonBlock(alertView, buttonIndex);
    }
}

@end

@implementation UIAlertView (BCHHelperKitUIKit)

#pragma mark - setter / getter
-(void)setBch_clickedButtonBlock:(BCHAlertClickedButtonBlock)bch_clickedButtonBlock
{
    objc_setAssociatedObject(self, s_bch_privateAlertViewKey, bch_clickedButtonBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(BCHAlertClickedButtonBlock)bch_clickedButtonBlock
{
    return objc_getAssociatedObject(self, s_bch_privateAlertViewKey);
}

#pragma mark - bch_showWithTitle:...
+(instancetype)bch_showWithTitle:(NSString *)title
                         message:(NSString *)message
                    buttonTitles:(NSArray *)buttonTitles
                           block:(BCHAlertClickedButtonBlock)block
{
    NSString *ok = nil;
    if (kIsArray(buttonTitles) && buttonTitles.count > 0) {
        ok = [buttonTitles bch_objectAtIndex:0];
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:[UIApplication sharedApplication]
                                              cancelButtonTitle:ok
                                              otherButtonTitles:
                              [buttonTitles bch_objectAtIndex:1],
                              [buttonTitles bch_objectAtIndex:2],
                              [buttonTitles bch_objectAtIndex:3],
                              [buttonTitles bch_objectAtIndex:4],
                              [buttonTitles bch_objectAtIndex:5],
                              [buttonTitles bch_objectAtIndex:6],
                              [buttonTitles bch_objectAtIndex:7],
                              [buttonTitles bch_objectAtIndex:8],
                              [buttonTitles bch_objectAtIndex:9],
                              [buttonTitles bch_objectAtIndex:10],
                              [buttonTitles bch_objectAtIndex:11],
                              [buttonTitles bch_objectAtIndex:12],
                              [buttonTitles bch_objectAtIndex:13],
                              [buttonTitles bch_objectAtIndex:14],
                              nil];
    alertView.bch_clickedButtonBlock = block;
    
    [alertView show];
    
    return alertView;
}



@end
