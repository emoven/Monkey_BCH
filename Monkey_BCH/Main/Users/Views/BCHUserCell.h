//
//  BCHUserCell.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCHUserModel;

@interface BCHUserCell : UITableViewCell

@property (nonatomic,strong) BCHUserModel *model;

+(id)cellWithTableView:(UITableView *)tableView;
+(CGFloat)cellHeight;

@end
