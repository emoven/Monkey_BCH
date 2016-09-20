//
//  UIImageView+BCHMasonryKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/22.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIImageView+BCHMasonryKit.h"

@implementation UIImageView (BCHMasonryKit)

+(instancetype)bch_imageView
{
    return [self bch_imageViewWithImage:nil isCircle:NO superView:nil constraints:nil onTaped:nil];
}

+(instancetype)bch_imageViewWithSuperView:(UIView *)superView
                              constraints:(BCHConstraintMaker)constraints
{
    return [self bch_imageViewWithImage:nil isCircle:NO superView:superView constraints:constraints onTaped:nil];
}

+(instancetype)bch_imageViewWithSuperView:(UIView *)superView
                              constraints:(BCHConstraintMaker)constraints
                                  onTaped:(BCHTapGestureBlock)onTaped
{
    return [self bch_imageViewWithImage:nil isCircle:NO superView:superView constraints:constraints onTaped:onTaped];
}

+(instancetype)bch_imageViewWithImage:(id)image
                            superView:(UIView *)superView
                          constraints:(BCHConstraintMaker)constraints
{
    return [self bch_imageViewWithImage:image isCircle:NO superView:superView constraints:constraints onTaped:nil];
}

+(instancetype)bch_imageViewWithImage:(id)image
                            superView:(UIView *)superView
                          constraints:(BCHConstraintMaker)constraints
                              onTaped:(BCHTapGestureBlock)onTaped
{
    return [self bch_imageViewWithImage:image
                               isCircle:NO
                              superView:superView
                            constraints:constraints
                                onTaped:onTaped];
}

+(instancetype)bch_imageViewWithImage:(id)image
                             isCircle:(BOOL)isCircle
                            superView:(UIView *)superView
                          constraints:(BCHConstraintMaker)constraints
                              onTaped:(BCHTapGestureBlock)onTaped
{
    UIImageView *imageView = [[UIImageView alloc]init];
    if (image != nil) {
        if ([image isKindOfClass:[NSString class]]) {
            image = kImage((NSString *)image);
        }
      
        if (![image isKindOfClass:UIImage.class]) {
            image = nil;
        }else{
            imageView.image = image;
        }
    }
    
    imageView.contentMode = UIViewContentModeScaleToFill;
    
    [superView addSubview:imageView];
    
    if (onTaped) {
        [imageView bch_addTapGestureWithCallBack:onTaped];
    }
    
    if (constraints && superView) {
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    
    if (isCircle) {
        [imageView performSelector:@selector(updateLayerToCircle:)
                      withObject:imageView
                      afterDelay:0.0];
    }
    
    return imageView;
}

- (void)updateLayerToCircle:(UIImageView *)imgView {
    imgView.layer.cornerRadius = imgView.bch_width / 2.0;
    imgView.layer.masksToBounds = YES;
    imgView.clipsToBounds = YES;
}

@end
