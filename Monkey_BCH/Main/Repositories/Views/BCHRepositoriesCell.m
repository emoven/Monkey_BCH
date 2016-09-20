//
//  BCHRepositoriesCell.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHRepositoriesCell.h"
#import "BCHRepositoriesModel.h"
#import "BCHUserModel.h"
#import "UIImageView+UIActivityIndicator.h"
@interface BCHRepositoriesCell()
@property (weak, nonatomic) IBOutlet UILabel *rankLable;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *startLable;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *ownerLable;
@property (weak, nonatomic) IBOutlet UILabel *linkLable;
@property (weak, nonatomic) IBOutlet UILabel *descLable;

@end

@implementation BCHRepositoriesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    return 120.f;
}

-(void)setModel:(BCHRepositoriesModel *)model{
    _model = model;
    
    self.rankLable.text = [NSString stringWithFormat:@"%ld",_model.rank + 1];
    self.nameLable.text = _model.name;
    self.startLable.text = [NSString stringWithFormat:@"Start:%ld",_model.stargazers_count];
    [self.imgView bch_setImageWithURL:[NSURL URLWithString:_model.owner.avatar_url] showActivityIndicatorView:YES];
    self.ownerLable.text = [NSString stringWithFormat:@"Owner:%@",_model.owner.login];
    self.descLable.text = _model.desc;
    self.linkLable.text = _model.homepage;
}

@end
