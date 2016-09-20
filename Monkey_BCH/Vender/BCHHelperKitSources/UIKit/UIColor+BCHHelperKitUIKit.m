//
//  UIColor+BCHHelperKitUIKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/22.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIColor+BCHHelperKitUIKit.h"

@implementation UIColor (BCHHelperKitUIKit)

-(UIImage *)bch_toImgae
{
    return [UIColor bch_imageWithColor:self size:CGSizeMake(1, 1)];
}

+(UIImage *)bch_imageWithColor:(UIColor *)color
{
    return [self bch_imageWithColor:color size:CGSizeMake(1, 1)];
}

-(UIImage *)bch_toImgaeWithSize:(CGSize)size
{
    return [UIColor bch_imageWithColor:self size:size];
}

+(UIImage *)bch_imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
