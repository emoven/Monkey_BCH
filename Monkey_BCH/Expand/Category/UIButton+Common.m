//
//  UIButton+Common.m
//  Coding_iOS
//
//  Created by 王 原闯 on 14-8-5.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import "UIButton+Common.h"
#import "NSString+BCHHelperKit.h"
#import "POP+MCAnimate.h"

@interface UIButton ()
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@end

@implementation UIButton (Common)

+ (UIButton *)bch_buttonWithUserStyle{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn bch_userNameStyle];
    return btn;
}
- (void)bch_userNameStyle{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 2.0;
    self.titleLabel.font = [UIFont systemFontOfSize:17];
//    [self setTitleColor:[UIColor colorWithHexString:@"0x222222"] forState:UIControlStateNormal];
    [self setTitleColor:kHexColor(0x3bbd79) forState:UIControlStateNormal];
    [self setBackgroundImage:[UIColor bch_imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIColor bch_imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
}

+ (UIButton *)tweetBtnWithFrame:(CGRect)frame alignmentLeft:(BOOL)alignmentLeft{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:kHexColor(0x999999) forState:UIControlStateNormal];
    if (alignmentLeft) {
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    }else{
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
    }
    return button;
}

- (void)setUserTitle:(NSString *)aUserName font:(UIFont *)font maxWidth:(CGFloat)maxWidth{
    [self setTitle:aUserName forState:UIControlStateNormal];
    CGRect frame = self.frame;
    CGFloat titleWidth = [self.titleLabel.text bch_getSizeWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, frame.size.height)].width;//[self.titleLabel.text getWidthWithFont:font constrainedToSize:CGSizeMake(CGFLOAT_MAX, frame.size.height)];
    if (titleWidth > maxWidth) {
        titleWidth = maxWidth;
        //        self.titleLabel.minimumScaleFactor = 0.5;
        //        self.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    [self setWidth:titleWidth];
    [self.titleLabel setWidth:titleWidth];
}

- (void)animateToImage:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    if (!image) {
        return;
    }
    [self setImage:image forState:UIControlStateNormal];
    if ([self superview]) {
        UIView *superV = [self superview];
        UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
        CGRect vFrame = [self convertRect:self.imageView.frame toView:superV];
        imageV.frame = vFrame;
        [superV addSubview:imageV];
        
        //animate
        CGAffineTransform fromTransform = imageV.transform;
        CGPoint fromCenter = imageV.center;
        CGFloat dx = CGRectGetWidth(self.frame) /2;
        CGFloat dy = CGRectGetHeight(self.frame) *3;
        CGFloat dScale = 3.0;
        CGFloat dRotation = M_PI_4;
        
        NSTimeInterval moveDurarion = 1.0;
        POPCustomAnimation *moveA = [POPCustomAnimation animationWithBlock:^BOOL(id target, POPCustomAnimation *animation) {
            float time_percent = (animation.currentTime - animation.beginTime)/moveDurarion;
            UIView *view = (UIView *)target;
            CGPoint toCenter = CGPointMake(fromCenter.x + time_percent * dx, fromCenter.y - (dy * time_percent * (2 - time_percent)));//抛物线移动
            view.center = toCenter;
            
            CGAffineTransform toTransform = fromTransform;
            toTransform = CGAffineTransformTranslate(toTransform, 50, -50);
            
            CGFloat toScale = 1 + time_percent *(dScale - 1);//线性放大
            toTransform = CGAffineTransformMakeScale(toScale, toScale);
            CGFloat toRotation = dRotation * (1- cosf(time_percent * M_PI_2));//cos曲线旋转（先慢后快）
            toTransform = CGAffineTransformRotate(toTransform, toRotation);
            view.transform = toTransform;
            
            view.alpha = 1 - time_percent;
            return time_percent < 1.0;
        }];
        [imageV pop_addAnimation:moveA forKey:@"animateToImage"];
    }
}

-(void)bch_animateToImage:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    if (!image) {
        return;
    }
    [self setImage:image forState:UIControlStateNormal];
    if ([self superview]) {
        UIView *superV = [self superview];
        UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
        CGRect vFrame = [self convertRect:self.imageView.frame toView:superV];
        imageV.frame = vFrame;
        [superV addSubview:imageV];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        animation.toValue=@-120;
        animation.duration=1.0;
        animation.removedOnCompletion=NO;
        animation.fillMode=kCAFillModeForwards;
        [imageV.layer addAnimation:animation forKey:@"transform.translation.y"];
        
        [UIView animateWithDuration:1.1 animations:^{
            imageV.layer.opacity = 0.0;
        } completion:^(BOOL finished) {
            [imageV removeFromSuperview];
        }];
        
    }
}

@end
