//
//  UIView+BCHHelperKitUIKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIView+BCHHelperKitUIKit.h"

@implementation UIView (BCHHelperKitUIKit)

#pragma mark - origin
-(void)setBch_origin:(CGPoint)bch_origin
{
    CGRect frame = self.frame;
    frame.origin = bch_origin;
    self.frame = frame;
}

-(CGPoint)bch_origin
{
    return self.frame.origin;
}

-(void)setBch_x:(CGFloat)bch_x
{
    [self setBch_origin:CGPointMake(bch_x, self.bch_y)];
}

-(CGFloat)bch_x
{
    return self.bch_origin.x;
}

-(void)setBch_y:(CGFloat)bch_y
{
    [self setBch_origin:CGPointMake(self.bch_x, bch_y)];
}

-(CGFloat)bch_y
{
    return self.bch_origin.y;
}

#pragma mark - center
-(void)setBch_center:(CGPoint)bch_center
{
    self.center = bch_center;
}

-(CGPoint)bch_center
{
    return self.center;
}

-(void)setBch_centerX:(CGFloat)bch_centerX
{
    [self setBch_center:CGPointMake(bch_centerX, self.bch_centerY)];
}

-(CGFloat)bch_centerX
{
    return self.bch_center.x;
}

-(void)setBch_centerY:(CGFloat)bch_centerY
{
    [self setBch_center:CGPointMake(self.bch_centerX, bch_centerY)];
}

-(CGFloat)bch_centerY
{
    return self.bch_center.y;
}

#pragma mark - size
-(void)setBch_size:(CGSize)bch_size
{
    CGRect frame = self.frame;
    frame.size = bch_size;
    self.frame = frame;
}

-(CGSize)bch_size
{
    return self.frame.size;
}

-(void)setBch_width:(CGFloat)bch_width
{
    self.bch_size = CGSizeMake(bch_width, self.bch_height);
}

-(CGFloat)bch_width
{
    return self.bch_size.width;
}

-(void)setBch_height:(CGFloat)bch_height
{
    self.bch_size = CGSizeMake(self.bch_width, bch_height);
}

-(CGFloat)bch_height
{
    return self.bch_size.height;
}

#pragma mark - other
- (CGFloat)bch_bottomY {
    return self.bch_y + self.bch_height;
}

- (void)setBch_bottomY:(CGFloat)bch_bottomY {
    self.bch_y = bch_bottomY - self.bch_height;
}

- (CGFloat)bch_rightX {
    return self.bch_x + self.bch_width;
}

- (void)setBch_rightX:(CGFloat)bch_rightX {
    self.bch_x = bch_rightX - self.bch_width;
}

#pragma mark - 上下左右
- (CGFloat)bch_top
{
    return self.frame.origin.y;
}

-(void)setBch_top:(CGFloat)bch_top
{
    CGRect newframe = self.frame;
    newframe.origin.y = bch_top;
    self.frame = newframe;
}

- (CGFloat)bch_left
{
    return self.frame.origin.x;
}

- (void)setBch_left:(CGFloat)bch_left
{
    CGRect newframe = self.frame;
    newframe.origin.x = bch_left;
    self.frame = newframe;
}

- (CGFloat)bch_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBch_bottom:(CGFloat)bch_bottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = bch_bottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)bch_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setBch_right:(CGFloat)bch_right
{
    CGFloat delta = bch_right - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (void)doCircleFrameWith:(UIColor *)color;{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = color.CGColor;
}

- (void)doCircleFrame{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = kHexColor(0xdddddd).CGColor;
}
- (void)doNotCircleFrame{
    self.layer.cornerRadius = 0.0;
    self.layer.borderWidth = 0.0;
}

- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = width;
    if (!color) {
        self.layer.borderColor = kHexColor(0xdddddd).CGColor;
    }else{
        self.layer.borderColor = color.CGColor;
    }
}


@end
