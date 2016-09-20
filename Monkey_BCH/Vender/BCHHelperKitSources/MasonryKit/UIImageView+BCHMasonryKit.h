//
//  UIImageView+BCHMasonryKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/22.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHHelperKit.h"

@interface UIImageView (BCHMasonryKit)

+(instancetype)bch_imageView;
+(instancetype)bch_imageViewWithSuperView:(UIView *)superView
                          constraints:(BCHConstraintMaker)constraints;
+(instancetype)bch_imageViewWithSuperView:(UIView *)superView
                          constraints:(BCHConstraintMaker)constraints
                              onTaped:(BCHTapGestureBlock)onTaped;

+(instancetype)bch_imageViewWithImage:(id)image
                        superView:(UIView *)superView
                          constraints:(BCHConstraintMaker)constraints;
+(instancetype)bch_imageViewWithImage:(id)image
                            superView:(UIView *)superView
                          constraints:(BCHConstraintMaker)constraints
                              onTaped:(BCHTapGestureBlock)onTaped;
+(instancetype)bch_imageViewWithImage:(id)image
                             isCircle:(BOOL)isCircle
                            superView:(UIView *)superView
                          constraints:(BCHConstraintMaker)constraints
                              onTaped:(BCHTapGestureBlock)onTaped;
@end
