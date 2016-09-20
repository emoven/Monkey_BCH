//
//  UICollectionView+BCHMasonryKit.h
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHHelperKit.h"

@interface UICollectionView (BCHMasonryKit)

+ (instancetype)bch_collectionViewWithDelegate:(id)delegate
                                    horizontal:(BOOL)isHorizontal
                                     superView:(UIView *)superView;

+ (instancetype)bch_collectionViewWithDelegate:(id)delegate
                                    horizontal:(BOOL)isHorizontal
                                          size:(CGSize)itemSize
                                     superView:(UIView *)superView;

+ (instancetype)bch_collectionViewWithDelegate:(id)delegate
                                    horizontal:(BOOL)isHorizontal
                                          size:(CGSize)itemSize
                                   itemSpacing:(CGFloat)minimumInteritemSpacing
                                   lineSpacing:(CGFloat)minimumLineSpacing
                                     superView:(UIView *)superView;

+ (instancetype)bch_collectionViewWithDelegate:(id)delegate
                                    horizontal:(BOOL)isHorizontal
                                          size:(CGSize)itemSize
                                   itemSpacing:(CGFloat)minimumInteritemSpacing
                                   lineSpacing:(CGFloat)minimumLineSpacing
                                     superView:(UIView *)superView
                                   constraints:(BCHConstraintMaker)constraints;

@end
