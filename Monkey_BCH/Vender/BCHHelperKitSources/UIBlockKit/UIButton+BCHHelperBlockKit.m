//
//  UIButton+BCHHelperBlockKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/18.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UIButton+BCHHelperBlockKit.h"

@implementation UIButton (BCHHelperBlockKit)

+(instancetype)bch_buttonWithTouchUp:(BCHButtonBlock) onTouchUp
{
    return [self bch_buttonWithSuperView:nil constraints:nil touchUp:onTouchUp];
}

+(instancetype)bch_buttonWithSuperView:(UIView *)superView
                           constraints:(BCHConstraintMaker)constraints touchUp:(BCHButtonBlock)touchUp
{
    return [self bch_buttonWithTitle:nil superView:superView constraints:constraints touchUp:touchUp];
}

+(instancetype)bch_buttonWithTitle:(NSString *)title
                         superView:(UIView *)superView
                       constraints:(BCHConstraintMaker)constraints touchUp:(BCHButtonBlock)touchUp
{
    return [self private_bch_buttonWithTitle:title image:nil selectImage:nil superView:superView constraints:constraints touchUp:touchUp];
}

+(instancetype)bch_buttonWithImage:(id)image
                         superView:(UIView *)superView
                       constraints:(BCHConstraintMaker)constraints touchUp:(BCHButtonBlock)touchUp
{
    return [self bch_buttonWithImage:image selectImage:nil superView:superView constraints:constraints touchUp:touchUp];
}

+(instancetype)bch_buttonWithImage:(id)image
                       selectImage:(id)selectImage
                         superView:(UIView *)superView
                       constraints:(BCHConstraintMaker)constraints touchUp:(BCHButtonBlock)touchUp
{
    return [self private_bch_buttonWithTitle:nil image:image selectImage:selectImage superView:superView constraints:constraints touchUp:touchUp];
}

#pragma mark - Private
+(instancetype)private_bch_buttonWithTitle:(NSString *)title
                                     image:(id)image
                               selectImage:(id)selectImage
                                 superView:(UIView *)superView
                               constraints:(BCHConstraintMaker)constraints touchUp:(BCHButtonBlock)touchUp
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bch_onTouchUp = touchUp;
    
    if (!kIsEmptyString(title)) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    UIImage *normalImage = nil;
    if ([image isKindOfClass:[NSString class]]) {
        normalImage = kImage(image);
    }else if ([image isKindOfClass:[UIImage class]]){
        normalImage = image;
    }
    
    UIImage *selectedImage = nil;
    if ([selectImage isKindOfClass:[NSString class]]) {
        selectedImage = kImage(selectImage);
    }else if ([selectImage isKindOfClass:[UIImage class]]){
        selectedImage = selectImage;
    }
    
    if (normalImage) {
        [button setImage:normalImage forState:UIControlStateNormal];
    }
    
    if (selectedImage) {
        [button setImage:selectedImage forState:UIControlStateSelected];
    }
    
    [superView addSubview:button];
    
    if (superView && constraints) {
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    
    return nil;
}


@end
