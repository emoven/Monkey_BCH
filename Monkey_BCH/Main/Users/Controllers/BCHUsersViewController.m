//
//  BCHUsersViewController.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/19.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHUsersViewController.h"
#import "BCHBelongToThisCityUsersViewController.h"
#import "BCHBelongToChinaUsersViewController.h"
#import "BCHBelongToWorldUsersViewController.h"
#import "BCHCountryViewController.h"
#import "BCHLanguageViewController.h"

@interface BCHUsersViewController ()
@property (weak, nonatomic) IBOutlet UILabel *totleCountLable;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *cityTitleButton;
@property (weak, nonatomic) IBOutlet UIButton *chinaTitleButton;
@property (weak, nonatomic) IBOutlet UIButton *worldTitleButton;


@property (nonatomic,strong) BCHBelongToThisCityUsersViewController *belongToThisCityVC;
@property (nonatomic,strong) BCHBelongToChinaUsersViewController *belongToChinaVC;
@property (nonatomic,strong) BCHBelongToWorldUsersViewController *belongToWorldVC;

@end

@implementation BCHUsersViewController
#pragma mark – Life Cycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navTitle = kUserDefaultObjectForKey(kSelectLanguageKey);
    if (kIsEmptyString(self.navTitle)) {
        self.navTitle = NSLocalizedString(@"all languages", @"");
    }
    self.navigationItem.title = self.navTitle;
    
    NSString *cityTitle = kUserDefaultObjectForKey(kSelectCityKey);
    if (kIsEmptyString(cityTitle)) {
        cityTitle = NSLocalizedString(@"beijing", @"");
    }
    [self.cityTitleButton setTitle:cityTitle forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpNav];
    [self setUpCityTitleButtons];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Events  
-(void)leftMenuAction:(id)sender{
    BCHCountryViewController *vc = [[BCHCountryViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)rightMenuAction:(id)sender{
    BCHLanguageViewController *VC= [[BCHLanguageViewController alloc]init];
    VC.languageType = LanguageTypeUsers;
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)cityTitleButtonClick:(id)sender {
    self.cityTitleButton.titleLabel.font = kFontWithSize(20);
    self.chinaTitleButton.titleLabel.font = kFontWithSize(15);
    self.worldTitleButton.titleLabel.font = kFontWithSize(15);
    
    self.cityTitleButton.selected = YES;
    self.chinaTitleButton.selected = NO;
    self.worldTitleButton.selected = NO;
    
    self.belongToThisCityVC.view.hidden = NO;
    self.belongToChinaVC.view.hidden = YES;
    self.belongToWorldVC.view.hidden = YES;
}

- (IBAction)chinaTitleButtonClick:(id)sender {
    
    kUserDefaultSetObjectForKey(@"China", kSelectCountryKey);
    
    self.cityTitleButton.titleLabel.font = kFontWithSize(15);
    self.chinaTitleButton.titleLabel.font = kFontWithSize(20);
    self.worldTitleButton.titleLabel.font = kFontWithSize(15);
    
    self.cityTitleButton.selected = NO;
    self.chinaTitleButton.selected = YES;
    self.worldTitleButton.selected = NO;
    
    self.belongToThisCityVC.view.hidden = YES;
    self.belongToChinaVC.view.hidden = NO;
    self.belongToWorldVC.view.hidden = YES;
}

- (IBAction)worldTitleButtonClick:(id)sender {
    self.cityTitleButton.titleLabel.font = kFontWithSize(15);
    self.chinaTitleButton.titleLabel.font = kFontWithSize(15);
    self.worldTitleButton.titleLabel.font = kFontWithSize(20);
    
    self.cityTitleButton.selected = NO;
    self.chinaTitleButton.selected = NO;
    self.worldTitleButton.selected = YES;
    
    self.belongToThisCityVC.view.hidden = YES;
    self.belongToChinaVC.view.hidden = YES;
    self.belongToWorldVC.view.hidden = NO;

}


#pragma mark – Private Methods
-(void)setUpNav{
    self.navTitle = NSLocalizedString(@"all languages", @"");
    [self setUpNavigationItemsWithLImg:nil lHImg:nil lTxt:@"城市" RImg:nil rHImg:nil rTxt:@"语言" title:self.navTitle titleColor:kWhiteColor fontSize:20.0];
}

-(void)setUpCityTitleButtons{
//    [self.cityTitleButton setTitle:NSLocalizedString(@"beijing", @"") forState:UIControlStateNormal];
//    [self.chinaTitleButton setTitle:NSLocalizedString(@"china", @"") forState:UIControlStateNormal];
//    [self.worldTitleButton setTitle:NSLocalizedString(@"world", @"") forState:UIControlStateNormal];
    
    self.cityTitleButton.titleLabel.font = kFontWithSize(20);
    self.chinaTitleButton.titleLabel.font = kFontWithSize(15);
    self.worldTitleButton.titleLabel.font = kFontWithSize(15);
    
    self.cityTitleButton.selected = YES;
    self.chinaTitleButton.selected = NO;
    self.worldTitleButton.selected = NO;
    
    self.belongToThisCityVC.view.hidden = NO;
    self.belongToChinaVC.view.hidden = YES;
    self.belongToWorldVC.view.hidden = YES;
}

#pragma mark - Custom Delegates


#pragma mark – Getters and Setters
-(BCHBelongToThisCityUsersViewController *)belongToThisCityVC{
    if (!_belongToThisCityVC) {
        _belongToThisCityVC = [[BCHBelongToThisCityUsersViewController alloc]init];
        kWeak(weakSelf, self);
        _belongToThisCityVC.belongToThisCityUsersBlock = ^(BCHBelongToThisCityUsersViewController *vc,NSInteger totalCount){
            weakSelf.totleCountLable.text = [NSString stringWithFormat:@"total:%ld",totalCount];
        };
        [self.contentView addSubview:_belongToThisCityVC.view];
        [self addChildViewController:_belongToThisCityVC];
    }
    return _belongToThisCityVC;
}

-(BCHBelongToChinaUsersViewController *)belongToChinaVC{
    if (!_belongToChinaVC) {
        _belongToChinaVC = [[BCHBelongToChinaUsersViewController alloc]init];
        kWeak(weakSelf, self);
        _belongToChinaVC.belongToChinaUsersBlock = ^(BCHBelongToChinaUsersViewController *vc,NSInteger totalCount){
            weakSelf.totleCountLable.text = [NSString stringWithFormat:@"total:%ld",totalCount];
        };
        [self.contentView addSubview:_belongToChinaVC.view];
        [self addChildViewController:_belongToChinaVC];
    }
    return _belongToChinaVC;
}

-(BCHBelongToWorldUsersViewController *)belongToWorldVC{
    if (!_belongToWorldVC) {
        _belongToWorldVC = [[BCHBelongToWorldUsersViewController alloc]init];
        kWeak(weakSelf, self);
        _belongToWorldVC.belongToWorldUsersBlock = ^(BCHBelongToWorldUsersViewController *vc,NSInteger totalCount){
            weakSelf.totleCountLable.text = [NSString stringWithFormat:@"total:%ld",totalCount];
        };
        [self.contentView addSubview:_belongToWorldVC.view];
        [self addChildViewController:_belongToWorldVC];
    }
    return _belongToWorldVC;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
