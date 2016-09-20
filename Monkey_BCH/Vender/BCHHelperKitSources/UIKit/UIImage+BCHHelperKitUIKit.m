//
//  UIImage+BCHHelperKitUIKit.m
//  TYHomeland
//
//  Created by yiliao on 16/8/2.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIImage+BCHHelperKitUIKit.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (BCHHelperKitUIKit)

+(UIImage *)bch_doRingWithImage:(UIImage *)img borderWidth:(CGFloat)width borderColor:(UIColor *)color{
    CGFloat borderW = width;
    //1.加载
//    UIImage *img = [UIImage imageNamed:@"阿狸头像"];
    CGSize size = CGSizeMake(img.size.width + 2 * borderW, img.size.height+ 2 * borderW);
    //2.开启图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //3.路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width , size.height)];
    //4.颜色填充
    [color set];
    [path fill];
    //5.图片路径
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, img.size.width, img.size.height)];
    [path addClip];
    //6.图片绘制
    [img drawInRect:CGRectMake(borderW, borderW, img.size.width, img.size.height)];
    //7.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //9.关闭图形上下文
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - 图片剪裁
+ (UIImage *)bch_cutImage:(UIImage *)image showWithsize:(CGSize)size{
    CGSize pubSize = size;//[self publishSize];
    if (image){
        CGSize imgSize = image.size;
        CGFloat pubRation = pubSize.height / pubSize.width;
        CGFloat imgRatio = imgSize.height / imgSize.width;
        if (fabs(imgRatio -  pubRation) < 0.01){ // 直接上传
            return image;
        }else{
            if (imgRatio > 1){
                // 长图，截正中间部份
                CGSize upSize = CGSizeMake(imgSize.width, (NSInteger)(imgSize.width * pubRation));
                UIImage *upimg = [self bch_private_cropImage:image inRect:CGRectMake(0, (image.size.height - upSize.height)/2, upSize.width, upSize.height)];
                return upimg;
            }else{
                // 宽图，截正中间部份
                CGSize upSize = CGSizeMake(imgSize.height, (NSInteger)(imgSize.height * pubRation));
                UIImage *upimg = [self bch_private_cropImage:image inRect:CGRectMake((image.size.width - upSize.width)/2, 0, upSize.width, upSize.height)];
                return upimg;
            }
        }
    }
    return image;
}

+ (UIImage *)bch_private_cropImage:(UIImage *)image inRect:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // translated rectangle for drawing sub image
    CGRect drawRect = CGRectMake(-rect.origin.x, -rect.origin.y, image.size.width, image.size.height);
    // clip to the bounds of the image context
    // not strictly necessary as it will get clipped anyway?
    CGContextClipToRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
    // draw image
    [image drawInRect:drawRect];
    // grab image
    UIImage* croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return croppedImage;
}

+ (UIImage *)bch_createImageFromView:(UIView *)formView{
    UIGraphicsBeginImageContext(formView.size);
    [formView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//裁减，是按照原始图片像素进行裁减，需注意
- (UIImage *)bch_imageCroppedToRect:(CGRect)rect{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

//高斯模糊
-(UIImage *)bch_blurWithBlurNumber:(CGFloat)blur {
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 250);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = self.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);    if (error) {        NSLog(@"error from convolution %ld", error);
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();    CGContextRef ctx = CGBitmapContextCreate( outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];    //clean up CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}

//高斯模糊
-(UIImage *)bch_blur2WithBlurNumber:(CGFloat)blur {
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:[CIImage imageWithCGImage:self.CGImage] forKey:kCIInputImageKey];
    [filter setValue:@(blur) forKey:kCIInputRadiusKey];
    return [UIImage imageWithCGImage:[[CIContext contextWithOptions:nil]
            createCGImage:[filter outputImage]
                          fromRect:[[filter outputImage] extent]]];
}

@end
