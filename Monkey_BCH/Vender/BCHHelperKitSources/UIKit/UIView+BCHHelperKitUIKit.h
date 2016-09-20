//
//  UIView+BCHHelperKitUIKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BCHHelperKitUIKit)

/**
 * view.frame.origin.x
 */
@property (nonatomic, assign) CGFloat bch_x;
/**
 * view.frame.origin.y
 */
@property (nonatomic, assign) CGFloat bch_y;
/**
 * view.frame.origin
 */
@property (nonatomic, assign) CGPoint bch_origin;

/**
 * view.center.x
 */
@property (nonatomic, assign) CGFloat bch_centerX;
/**
 * view.center.y
 */
@property (nonatomic, assign) CGFloat bch_centerY;
/**
 * view.center
 */
@property (nonatomic, assign) CGPoint bch_center;

/**
 * view.frame.size.width
 */
@property (nonatomic, assign) CGFloat bch_width;
/**
 * view.frame.size.height
 */
@property (nonatomic, assign) CGFloat bch_height;
/**
 * view.frame.size
 */
@property (nonatomic, assign) CGSize bch_size;


/**
 * view.frame.size.height + view.frame.origin.y
 */
@property (nonatomic, assign) CGFloat bch_bottomY;

/**
 * view.frame.size.width + view.frame.origin.x
 */
@property (nonatomic, assign) CGFloat bch_rightX;

/**
 *  view.frame.origin.y
 */
@property (nonatomic, assign) CGFloat bch_top;
/**
 *  view.frame.origin.y + view.frame.size.height
 */
@property (nonatomic, assign) CGFloat bch_bottom;
/**
 *  view.frame.origin.x
 */
@property (nonatomic, assign) CGFloat bch_left;
/**
 *  view.frame.origin.x + view.frame.size.width
 */
@property (nonatomic, assign) CGFloat bch_right;


- (void)doCircleFrameWith:(UIColor *)color;
- (void)doCircleFrame;
- (void)doNotCircleFrame;
- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;

@end
