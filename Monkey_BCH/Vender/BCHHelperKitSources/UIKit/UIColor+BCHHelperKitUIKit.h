//
//  UIColor+BCHHelperKitUIKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/22.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BCHHelperKitUIKit)

-(UIImage *)bch_toImgae;

+(UIImage *)bch_imageWithColor:(UIColor *)color;

-(UIImage *)bch_toImgaeWithSize:(CGSize)size;

+(UIImage *)bch_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
