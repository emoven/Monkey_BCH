//
//  BCHBelongToChinaUsersViewController.m
//  Monkey_BCH
//
//  Created by yiliao on 16/9/20.
//  Copyright © 2016年 Yao. All rights reserved.
//

#import "BCHBelongToChinaUsersViewController.h"
#import "MJRefresh.h"
#import "BCHUserModel.h"
#import "BCHUserCell.h"

@interface BCHBelongToChinaUsersViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 上一次请求的参数 */
@property (nonatomic,strong) NSString *pre_params;
@property (nonatomic,strong) NSMutableArray *dataArray;
/** 当前页码 */
@property (nonatomic, assign) NSInteger page;

@end

@implementation BCHBelongToChinaUsersViewController
#pragma mark – Life Cycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *language = kUserDefaultObjectForKey(kSelectLanguageKey);
    if (kIsEmptyString(language)) {
        language = NSLocalizedString(@"all languages", @"");
        
    }
    self.language = language;
    self.location = kUserDefaultObjectForKey(kSelectCountryKey);;
    
    [self.tableView.mj_header beginRefreshing];
    [self loadNewUsers];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, kNavigationBarHeight + kStatusBarHeight + kLanguageBarHeight + ktabBarHeight, 0);
    [self setTableViewSeparatorInset];
    [self setUpRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Events


#pragma mark – Private Methods
-(void)setTableViewSeparatorInset{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)setUpRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
}

-(void)loadNewUsers{
    [self.tableView.mj_footer endRefreshing];
    if (kIsEmptyString(self.location)) {
        self.location = @"beijing";
    }
    if (kIsEmptyString(self.language)) {
        self.language = NSLocalizedString(@"all languages", @"");
    }
    NSString *q=[NSString stringWithFormat:@"location:%@+language:%@",self.location,self.language];
    
    //如果是"所有语言",那就不需要"language"
    if ([self.language isEqualToString:NSLocalizedString(@"all languages", @"")]) {
        q=[NSString stringWithFormat:@"location:%@",self.location];
    }
    NSInteger page = 1;// @"/search/users?q=location:USA+language:Java&sort=followers&page=1"
    NSString *url = [NSString stringWithFormat:@"search/users?q=%@&sort=followers&page=%ld",q,page];
    self.pre_params = url;
    kWeak(weakSelf, self);
    [HYBNetworking getWithUrl:url refreshCache:YES success:^(id response) {
        TYLog(@"response:%@",[NSObject bch_toJsonStringWithObject:response]);
        if (self.pre_params != url) return;
        [weakSelf.dataArray removeAllObjects];
        NSDictionary *resDict = (NSDictionary *)response;
        NSInteger totalCount = [resDict[@"total_count"]integerValue];
        if (_belongToChinaUsersBlock) {
            _belongToChinaUsersBlock(self,totalCount);
        }
        NSArray *array = resDict[@"items"];
        if (!kIsEmptyObject(array)) {
            for (int i = 0; i < array.count; i++) {
                BCHUserModel *model = [BCHUserModel yy_modelWithDictionary:array[i]];
                [weakSelf.dataArray addObject:model];
            }
        }
        //回到第一页
        weakSelf.page = 1;
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
    } fail:^(NSError *error) {
        if (self.pre_params != url) return;
        [weakSelf.tableView.mj_header endRefreshing];
        [SVProgressHUD showHudTipStr:@"网络有误,请稍后再试!"];
    }];
}

- (void)loadMoreUsers{
    [self.tableView.mj_header endRefreshing];
    if (kIsEmptyString(self.location)) {
        self.location = @"beijing";
    }
    if (kIsEmptyString(self.language)) {
        self.language = NSLocalizedString(@"all languages", @"");
    }
    NSString *q=[NSString stringWithFormat:@"location:%@+language:%@",self.location,self.language];
    //如果是"所有语言",那就不需要"language"
    if ([self.language isEqualToString:NSLocalizedString(@"all languages", @"")]) {
        q=[NSString stringWithFormat:@"location:%@",self.location];
    }
    NSInteger page = self.page + 1;
    NSString *url = [NSString stringWithFormat:@"search/users?q=%@&sort=followers&page=%ld",q,page];
    self.pre_params = url;
    kWeak(weakSelf, self);
    [HYBNetworking getWithUrl:url refreshCache:YES success:^(id response) {
        if (weakSelf.pre_params != url) return;
        NSDictionary *resDict = (NSDictionary *)response;
        NSInteger totalCount = [resDict[@"total_count"]integerValue];
        if (_belongToChinaUsersBlock) {
            _belongToChinaUsersBlock(self,totalCount);
        }
        NSArray *array = resDict[@"items"];
        if (!kIsEmptyObject(array)) {
            for (int i = 0; i < array.count; i++) {
                BCHUserModel *model = [BCHUserModel yy_modelWithDictionary:array[i]];
                [weakSelf.dataArray addObject:model];
            }
        }
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_footer endRefreshing];
        // 设置页码
        weakSelf.page = page;
    } fail:^(NSError *error) {
        if (weakSelf.pre_params != url) return;
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BCHUserModel *model = self.dataArray[indexPath.row];
    model.rank = indexPath.row;
    
    BCHUserCell *cell = [BCHUserCell cellWithTableView:tableView];
    cell.model = model;
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [BCHUserCell cellHeight];
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
        _dataArray = [NSMutableArray array];
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
