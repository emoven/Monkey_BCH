//
//  UIImage+Drawer.m
//  TYHomeland
//
//  Created by 白成慧&瑞瑞 on 16/7/29.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIImage+Drawer.h"

@implementation UIImage (Drawer)

+(UIImage*)drawerButtonItemImage{
    
    static UIImage *drawerButtonImage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        UIGraphicsBeginImageContextWithOptions( CGSizeMake(23, 23), NO, 0 );
        
        //// Color Declarations
        UIColor* fillColor = kWhiteColor;
        
        //// Frames
        CGRect frame = CGRectMake(0, 0, 23, 23);
        
        //// Bottom Bar Drawing
        UIBezierPath* bottomBarPath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 13) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 1) * 0.72000 + 0.5), 13, 1)];
        [fillColor setFill];
        [bottomBarPath fill];
        
        
        //// Middle Bar Drawing
        UIBezierPath* middleBarPath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 13) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 1) * 0.48000 + 0.5), 13, 1)];
        [fillColor setFill];
        [middleBarPath fill];
        
        
        //// Top Bar Drawing
        UIBezierPath* topBarPath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 13) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 1) * 0.24000 + 0.5), 13, 1)];
        [fillColor setFill];
        [topBarPath fill];
        
        drawerButtonImage = UIGraphicsGetImageFromCurrentImageContext();
    });
    
    return drawerButtonImage;
}


@end
