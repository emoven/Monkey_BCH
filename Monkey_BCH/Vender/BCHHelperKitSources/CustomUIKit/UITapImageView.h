//
//  UITapImageView.h
//  Coding_iOS
//
//  Created by 王 原闯 on 14-8-7.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITapImageView : UIImageView

/**
 *  bch:添加点击手势Block
 *
 *  @param tapAction 添加点击执行的 Block
 */
- (void)addTapBlock:(void(^)(id obj))tapAction;

/**
 *  bch:设置根据url获取图片的同时添加点击手势的block
 *
 *  @param imgUrl           图片url
 *  @param placeholderImage 占位图
 *  @param tapAction        点击手势block
 */
-(void)setImageWithUrl:(NSURL *)imgUrl placeholderImage:(UIImage *)placeholderImage tapBlock:(void(^)(id obj))tapAction;
@end
