//
//  UITextField+BCHMasonryKit.m
//  BCHHelperKit
//
//  Created by yiliao on 16/7/25.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "UITextField+BCHMasonryKit.h"
#import <objc/runtime.h>
#import "UIView+BCHHelperKitUIKit.h"

@implementation UITextField (BCHMasonryKit)


-(CGFloat)bch_leftMarginOfCursor
{
    NSNumber *number = objc_getAssociatedObject(self, _cmd);
    if ([number respondsToSelector:@selector(floatValue)]) {
        return [number floatValue];
    }
    return 8.f;
}

-(void)setBch_leftMarginOfCursor:(CGFloat)bch_leftMarginOfCursor
{
    objc_setAssociatedObject(self, @selector(bch_leftMarginOfCursor), @(bch_leftMarginOfCursor), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(instancetype)bch_textFiledWithHolder:(NSString *)holder
                             superView:(UIView *)superView
                           constraints:(BCHConstraintMaker)constraints
{
    return [self bch_textFiledWithHolder:holder
                                    text:nil
                                delegate:nil
                               superView:superView
                             constraints:constraints];
}

+(UITextField *)bch_textFiledWithHolder:(NSString *)holder
                               delegate:(id<UITextFieldDelegate>)delegate
                              superView:(UIView *)superView
                            constraints:(BCHConstraintMaker)constraints
{
     return [self bch_textFiledWithHolder:holder
                                     text:nil
                                 delegate:delegate
                                superView:superView
                              constraints:constraints];
}

+(UITextField *)bch_textFiledWithHolder:(NSString *)holder
                                   text:(NSString *)text
                              superView:(UIView *)superView
                            constraints:(BCHConstraintMaker)constraints
{
     return [self bch_textFiledWithHolder:holder
                                     text:text
                                 delegate:nil
                                superView:superView
                              constraints:constraints];
}

+(UITextField *)bch_textFiledWithHolder:(NSString *)holder
                                   text:(NSString *)text
                               delegate:(id<UITextFieldDelegate>)delegate
                              superView:(UIView *)superView
                            constraints:(BCHConstraintMaker)constraints
{
    UITextField *textField = [[UITextField alloc] init];
    textField.borderStyle = UITextBorderStyleNone;
    textField.leftView = [[UIView alloc] init];
    textField.leftView.backgroundColor = [UIColor clearColor];
    textField.leftView.bch_width = textField.bch_leftMarginOfCursor;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.spellCheckingType = UITextSpellCheckingTypeNo;
    textField.delegate = delegate;
    [superView addSubview:textField];
    
    textField.placeholder = holder;
    textField.text = text;
    
    if (superView && constraints) {
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    
    return textField;

}

@end
