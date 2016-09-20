//
//  BCHCityViewController.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHCityViewController.h"

@interface BCHCityViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BCHCityViewController
#pragma mark – Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpNav];
    [self setTableViewSeparatorInset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Events
-(void)leftMenuAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark – Private Methods
-(void)setUpNav
{
    [self setUpNavigationItemsWithLImg:[[UIImage imageNamed:@"btBack"]imageWithTintColor:kWhiteColor] lHImg:nil lTxt:nil RImg:nil rHImg:nil rTxt:nil title:NSLocalizedString(@"Select City", @"") titleColor:kWhiteColor fontSize:20.0];
}
-(void)setTableViewSeparatorInset{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cityArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"CityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.cityArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    kUserDefaultSetObjectForKey(self.cityArray[indexPath.row], kSelectCityKey);
    
    [self.navigationController popToRootViewControllerAnimated:YES];
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
#pragma mark - Custom Delegates
#pragma mark – Getters and Setters



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
