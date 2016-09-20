//
//  BCHCountryViewController.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHCountryViewController.h"
#import "BCHCityViewController.h"

@interface BCHCountryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *countrysArray;

@end

@implementation BCHCountryViewController
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
    [self setUpNavigationItemsWithLImg:[[UIImage imageNamed:@"btBack"]imageWithTintColor:kWhiteColor] lHImg:nil lTxt:nil RImg:nil rHImg:nil rTxt:nil title:NSLocalizedString(@"Select Country", @"") titleColor:kWhiteColor fontSize:20.0];
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
    return self.countrysArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"CountryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.countrysArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    kUserDefaultSetObjectForKey(self.countrysArray[indexPath.row], kSelectCountryKey);
    
    NSArray *cityArray;
    if (indexPath.row==0) {
        //美国
        cityArray= @[@"San Francisco",@"New York",@"Seattle",@"Chicago",@"Los Angeles",@"Boston",@"Washington",@"San Diego",@"San Jose",@"Philadelphia"];
        
    }else if (indexPath.row==1){
        //        uk
        cityArray= @[@"London",@"Cambridge",@"Manchester",@"Edinburgh",@"Bristol",@"Birmingham",@"Glasgow",@"Oxford",@"Newcastle",@"Leeds"];
    }else if (indexPath.row==2){
        //germany
        cityArray= @[@"Berlin",@"Munich",@"Hamburg",@"Cologne",@"Stuttgart",@"Dresden",@"Leipzig"];
    }else if (indexPath.row==3){
        cityArray= @[@"beijing",@"shanghai",@"shenzhen",@"hangzhou",@"guangzhou",@"chengdu",@"nanjing",@"wuhan",@"suzhou",@"xiamen",@"tianjin",@"chongqing",@"changsha"];
        
    }else if (indexPath.row==4){
        //        canada
        cityArray= @[@"Toronto",@"Vancouver",@"Montreal",@"ottawa",@"Calgary",@"Quebec"];
    }else if (indexPath.row==5){
        //        india
        cityArray= @[@"Chennai",@"Pune",@"Hyderabad",@"Mumbai",@"New Delhi",@"Noida",@"Ahmedabad",@"Gurgaon",@"Kolkata"];
    }else if (indexPath.row==6){
        //        france
        cityArray= @[@"paris",@"Lyon",@"Toulouse",@"Nantes"];
    }else if (indexPath.row==7){
        //        澳大利亚
        cityArray= @[@"sydney",@"Melbourne",@"Brisbane",@"Perth"];
    }else if (indexPath.row==8){
        //        other
        cityArray= @[@"Tokyo",@"Moscow",@"Singapore",@"Seoul"];
    }
    BCHCityViewController *vc=[[BCHCityViewController alloc] init];
    vc.cityArray=cityArray;
    
    [self.navigationController pushViewController:vc animated:YES];
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
-(NSMutableArray *)countrysArray{
    if (!_countrysArray) {
        NSArray*countrys=@[@"USA",@"UK",@"Germany",@"China",
                           @"Canada",@"India",@"France",@"Australia",
                           @"Other"];;
        _countrysArray = [NSMutableArray arrayWithArray:countrys];
    }
    return _countrysArray;
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
