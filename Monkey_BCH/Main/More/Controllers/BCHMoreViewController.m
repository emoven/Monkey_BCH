//
//  BCHMoreViewController.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/19.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHMoreViewController.h"
#import "BCHLoginWebViewController.h"
#import "BCHUserModel.h"
#import "UIImageView+UIActivityIndicator.h"

@interface BCHMoreViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) BCHUserModel *currentLoginUser;

@end

@implementation BCHMoreViewController
#pragma mark – Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpNav];
    
    [self setTableViewSeparatorInset];
    
    self.tableView.sectionHeaderHeight = 44.f;
    self.tableView.sectionFooterHeight = 0.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Events

#pragma mark – Private Methods
-(void)setUpNav
{
    [self setUpNavigationItemsWithLImg:nil lHImg:nil lTxt:nil RImg:nil rHImg:nil rTxt:nil title:NSLocalizedString(@"Discovery", @"") titleColor:kWhiteColor fontSize:20.0];
}

-(void)setTableViewSeparatorInset{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)getUserInfo{
    NSString *token=kUserDefaultObjectForKey(kAccess_tokenKey);
    if (kIsEmptyString(token)) {
        return;
    }
    NSString *url = [NSString stringWithFormat:@"user?access_token=%@",token];
    
    kWeak(weakSelf, self);
    [HYBNetworking getWithUrl:url refreshCache:YES success:^(id response) {
        TYLog(@"response:%@",[NSObject bch_toJsonStringWithObject:response]);
        NSDictionary *resDict = (NSDictionary *)response;
        weakSelf.currentLoginUser = [BCHUserModel yy_modelWithDictionary:resDict];
        TYLog(@"%@",weakSelf.currentLoginUser);
        
        [weakSelf.tableView reloadData];
    } fail:^(NSError *error) {
        [SVProgressHUD showHudTipStr:@"网络有误,请稍后再试!"];
    }];

}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.currentLoginUser) {
        return 5;
    }
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"MoreCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (self.currentLoginUser) {
        if (indexPath.section == 0) {
            cell.textLabel.text = self.currentLoginUser.login;
            [cell.imageView bch_setImageWithURL:[NSURL URLWithString:self.currentLoginUser.avatar_url] showActivityIndicatorView:YES];
        }else{
            cell.textLabel.text = self.dataArray[indexPath.section];
        }
    }else{
        cell.textLabel.text = self.dataArray[indexPath.section];
    }
    
    return cell;
}
   
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (self.currentLoginUser) {
            
        }else{
            BCHLoginWebViewController *vc = [[BCHLoginWebViewController alloc]init];
            vc.urlString = [NSString stringWithFormat:@"https://github.com/login/oauth/authorize/?client_id=8b5497250a9c86697dd8&state=1992&redirect_uri=https://github.com/Baichenghui/Monkey_BCH"];
            kWeak(weakSelf, self);
            vc.loginWebVCBlock = ^(BCHLoginWebViewController *vc, NSString *status){
                [weakSelf getUserInfo];
            };
            [self presentViewController:vc animated:YES completion:nil];
        }
    }else if (indexPath.section == 1){
    
    }else if (indexPath.section == 2){
        
    }else if (indexPath.section == 3){
        
    }else{
        if (self.currentLoginUser) {
//            [UIAlertController bch_showWithTitle:@"提示" message:@"确定退出登录?" buttonTitles:@[NSLocalizedString(@"confirm", @""),NSLocalizedString(@"cancel", @"")] preferredStyle:UIAlertControllerStyleAlert block:^(UIAlertAction *action, NSUInteger buttonIndex) {
//                TYLog(@"buttonIndex:%ld",buttonIndex);
//            }]; 

//            [UIView bch_showWithTitle:@"提示" message:@"确定退出登录?" buttonTitles:@[NSLocalizedString(@"confirm", @""),NSLocalizedString(@"cancel", @"")] callback:^(id sender, NSUInteger buttonIndex) {
//                TYLog(@"buttonIndex:%ld",buttonIndex);
//            }];

            [UIView bch_showWithTitle:@"title" cancelTitle:@"cancel" destructiveTitle:@"destructiveTitle" otherTitles:@[@"a",@"b",@"c",@"d",@"e"] callback:^(id sender, NSInteger buttonIndex) {
                TYLog(@"buttonIndex:%ld",buttonIndex);
            }];
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}
// 去掉 cell 左边的线
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
#pragma mark – Getters and Setters
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        NSArray *array = @[NSLocalizedString(@"login", @""),NSLocalizedString(@"about", @""),NSLocalizedString(@"feedback", @""),@"Network Debug",NSLocalizedString(@"logout",@"")];
        _dataArray = [NSMutableArray arrayWithArray:array];
    }
    return _dataArray;
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
