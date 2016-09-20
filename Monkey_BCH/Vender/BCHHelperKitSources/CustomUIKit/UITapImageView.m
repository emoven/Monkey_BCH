//
//  UITapImageView.m
//  Coding_iOS
//
//  Created by 王 原闯 on 14-8-7.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import "UITapImageView.h"
#import "UIImageView+WebCache.h"

@interface  UITapImageView ()

@property (nonatomic, copy) void(^tapAction)(id);

@end

@implementation UITapImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

//bch:点击手势执行方法
- (void)tap{
    
    //bch:调用 保存的block 方法
    if (self.tapAction) {
        self.tapAction(self);
    }
}

//bch:添加点击执行的Block
- (void)addTapBlock:(void(^)(id obj))tapAction{
   
    //bch:保存block
    self.tapAction = tapAction;
    
    //bch:创建 点击手势 并 添加
    if (![self gestureRecognizers]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        //bch:添加手势
        [self addGestureRecognizer:tap];
    }
}

//bch:设置根据url获取图片的同时添加点击手势的block
-(void)setImageWithUrl:(NSURL *)imgUrl placeholderImage:(UIImage *)placeholderImage tapBlock:(void(^)(id obj))tapAction{
    
    //bch:设置图片
    [self sd_setImageWithURL:imgUrl placeholderImage:placeholderImage];
    
    //bch:添加点击执行的 block
    [self addTapBlock:tapAction];
}

@end
