//
//  BCHShadowLable.m
//  TYHomeland
//
//  Created by yiliao on 16/8/31.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHShadowLable.h"

@implementation BCHShadowLable


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    NSMutableParagraphStyle *paragraph=[[NSMutableParagraphStyle alloc]init];
//    paragraph.alignment=NSTextAlignmentCenter;//居中
//    
//    NSDictionary* attrs =@{NSFontAttributeName:kFontWithSize(30),//文本的颜色 字体 大小
//                           NSForegroundColorAttributeName:[UIColor redColor],//文字颜色
//                           NSParagraphStyleAttributeName:paragraph,//段落格式
//                           //NSBackgroundColorAttributeName:[UIColor blueColor],//背景色
//                           NSStrokeWidthAttributeName:@-3, //描边宽度
//                           NSStrokeColorAttributeName:[UIColor greenColor],//设置 描边颜色，和NSStrokeWidthAttributeName配合使用,设置了这个NSForegroundColorAttributeName就失效了
//                           };
//    [self.text drawInRect:self.bounds withAttributes:attrs];
//    
//}

- (void)drawTextInRect:(CGRect)rect {
    
    CGSize shadowOffset = self.shadowOffset;
    UIColor *textColor = self.textColor;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(c, 2.5);
    CGContextSetLineJoin(c, kCGLineJoinRound);
    
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    self.textColor = kRGBColor(75, 124, 42);
    [super drawTextInRect:rect];
    
    CGContextSetTextDrawingMode(c, kCGTextFill);
    self.textColor = textColor;
    self.shadowOffset = CGSizeMake(0, 0);
    [super drawTextInRect:rect];
    
    self.shadowOffset = shadowOffset;
    
}

@end
