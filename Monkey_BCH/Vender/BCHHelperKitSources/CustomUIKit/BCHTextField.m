//
//  BCHTextField.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/27.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHTextField.h"

@implementation BCHTextField


- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect textRect = [super leftViewRectForBounds:bounds];
    textRect.origin.x += 5;
    return textRect;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
    CGRect textRect = [super rightViewRectForBounds:bounds];
    textRect.origin.x -= 5;
    textRect.size.width -= 5;
    textRect.size.height -= 5;
    return textRect;
}

@end
