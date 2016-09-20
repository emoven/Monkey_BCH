//
//  BCHRepositoriesCell.h
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCHRepositoriesModel;

@interface BCHRepositoriesCell : UITableViewCell

@property (nonatomic,strong) BCHRepositoriesModel *model;

+(id)cellWithTableView:(UITableView *)tableView;
+(CGFloat)cellHeight;

@end
