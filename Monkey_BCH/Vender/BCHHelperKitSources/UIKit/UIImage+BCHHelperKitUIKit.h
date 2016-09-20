//
//  UIImage+BCHHelperKitUIKit.h
//  TYHomeland
//
//  Created by yiliao on 16/8/2.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BCHHelperKitUIKit)

+(UIImage *)bch_doRingWithImage:(UIImage *)img borderWidth:(CGFloat)width borderColor:(UIColor *)color;

/** 剪切图片 上传头像 长图截取中间部分*/
+ (UIImage *)bch_cutImage:(UIImage *)image showWithsize:(CGSize)size;

+ (UIImage *)bch_createImageFromView:(UIView *)formView;

//裁减，是按照原始图片像素进行裁减，需注意
- (UIImage *)bch_imageCroppedToRect:(CGRect)rect;

//高斯模糊
- (UIImage *)bch_blurWithBlurNumber:(CGFloat)blur;

- (UIImage *)bch_blur2WithBlurNumber:(CGFloat)blur;
@end
