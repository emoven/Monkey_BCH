//
//  UIActionSheet+BCHHelperKitUIKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIActionSheet+BCHHelperKitUIKit.h"
#import <objc/runtime.h>
#import "NSArray+BCHHelperKit.h"

static const void *s_bch_privateActionSheetKey = "s_bch_privateActionSheetKey";


@interface UIApplication (HDFActionSheet) <UIActionSheetDelegate>

@end

@implementation UIApplication (HDFActionSheet)

- (void)actionSheet:(nonnull UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.bch_clickedButtonBlock) {
        actionSheet.bch_clickedButtonBlock(actionSheet, buttonIndex);
    }
}

@end

@implementation UIActionSheet (BCHHelperKitUIKit)

#pragma mark - setter / getter
-(void)setBch_clickedButtonBlock:(BCHActionSheetClickedButtonBlock)bch_clickedButtonBlock
{
    objc_setAssociatedObject(self, s_bch_privateActionSheetKey, bch_clickedButtonBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(BCHActionSheetClickedButtonBlock)bch_clickedButtonBlock
{
    return objc_getAssociatedObject(self, s_bch_privateActionSheetKey);
}

#pragma mark - bch_showWithTitle:...
+(instancetype)bch_showInView:(UIView *)inView
                        title:(NSString *)title
                  cancelTitle:(NSString *)cancelTitle
             destructiveTitle:(NSString *)destructiveTitle otherTitles:(NSArray *)otherTitles
                     callback:(BCHActionSheetClickedButtonBlock)callback
{
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:title
                                                    delegate:[UIApplication sharedApplication]
                                           cancelButtonTitle:cancelTitle
                                      destructiveButtonTitle:destructiveTitle
                                           otherButtonTitles:
                         [otherTitles bch_objectAtIndex:0],
                         [otherTitles bch_objectAtIndex:1],
                         [otherTitles bch_objectAtIndex:2],
                         [otherTitles bch_objectAtIndex:3],
                         [otherTitles bch_objectAtIndex:4],
                         [otherTitles bch_objectAtIndex:5],
                         [otherTitles bch_objectAtIndex:6],
                         [otherTitles bch_objectAtIndex:7],
                         [otherTitles bch_objectAtIndex:8],
                         [otherTitles bch_objectAtIndex:9],
                         [otherTitles bch_objectAtIndex:10],
                         [otherTitles bch_objectAtIndex:11],
                         [otherTitles bch_objectAtIndex:12],
                         [otherTitles bch_objectAtIndex:13],
                         [otherTitles bch_objectAtIndex:14],
                         [otherTitles bch_objectAtIndex:15],
                         [otherTitles bch_objectAtIndex:16],
                         [otherTitles bch_objectAtIndex:17],
                         [otherTitles bch_objectAtIndex:18],
                         [otherTitles bch_objectAtIndex:19],
                         [otherTitles bch_objectAtIndex:20],
                         [otherTitles bch_objectAtIndex:21],
                         [otherTitles bch_objectAtIndex:22],
                         [otherTitles bch_objectAtIndex:23],
                         [otherTitles bch_objectAtIndex:24],
                         [otherTitles bch_objectAtIndex:25],
                         [otherTitles bch_objectAtIndex:26],
                         [otherTitles bch_objectAtIndex:27],
                         [otherTitles bch_objectAtIndex:28],
                         [otherTitles bch_objectAtIndex:29],nil];
    as.bch_clickedButtonBlock = callback;
    
    [as showInView:inView];
    
    return as;

}

@end
