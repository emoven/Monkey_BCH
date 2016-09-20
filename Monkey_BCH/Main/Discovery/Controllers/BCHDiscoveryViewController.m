//
//  BCHDiscoveryViewController.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/19.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHDiscoveryViewController.h"

@interface BCHDiscoveryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation BCHDiscoveryViewController
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

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"DiscoveryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.dataArray[indexPath.section];
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
        NSArray *array = @[@"trending",@"showcases",NSLocalizedString(@"News", @""),NSLocalizedString(@"search", @""),@"githubranking",@"github-awards"];
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
