//
//  UIView+BCHActionSheet.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/21.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BCHActionSheetBlock)(id sender,NSInteger buttonIndex);

@interface UIView (BCHActionSheet)

@property (nonatomic,strong) BCHActionSheetBlock bch_actionSheetBlock;

+ (void)bch_showWithTitle:(NSString *)title
                   cancelTitle:(NSString *)cancelTitle
              destructiveTitle:(NSString *)destructiveTitle
                   otherTitles:(NSArray *)otherTitles
                      callback:(BCHActionSheetBlock)callback;

@end
