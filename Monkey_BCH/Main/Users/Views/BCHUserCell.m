//
//  BCHUserCell.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//


#import "BCHUserCell.h"
#import "UIImageView+UIActivityIndicator.h"
#import "BCHUserModel.h"
@interface BCHUserCell()

@property (weak, nonatomic) IBOutlet UILabel *userRankLable;
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLable;


@end

@implementation BCHUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userHeadImageView.layer.cornerRadius = 10;
    self.userHeadImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(id)cellWithTableView:(UITableView *)tableView{
    NSString *className = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:className];
    return [tableView dequeueReusableCellWithIdentifier:className];
}

+(CGFloat)cellHeight{
    return 80.f;
}

-(void)setModel:(BCHUserModel *)model{
    _model = model;
    
    self.userRankLable.text = [NSString stringWithFormat:@"%ld",_model.rank + 1];
    [self.userHeadImageView bch_setImageWithURL:[NSURL URLWithString:_model.avatar_url] showActivityIndicatorView:YES];
    self.userNameLable.text = _model.login;
}

@end
