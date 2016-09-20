//
//  UIScrollView+HideKeyBoard.m
//  TYHomeland
//
//  Created by yiliao on 16/7/29.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIScrollView+HideKeyBoard.h"

@implementation UIScrollView (HideKeyBoard)

-(void)bch_clickToHideKeyboard
{
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bch_hideKeyboard)];
    [self addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
}

- (void) bch_hideKeyboard {
    [self endEditing:YES];
}

@end
