
//
//  MorePlanViewController.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/11.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "MorePlanViewController.h"

#import "MorePlanHeaderView.h"

@interface MorePlanViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) MorePlanHeaderView *headerView;

@end

@implementation MorePlanViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.view.backgroundColor = [UIColor whiteColor];
    [self initializeDataSource];
    [self initializeUserInterface];
}

#pragma mark - 数据初始化
- (void)initializeDataSource
{
    [self setIndicatorTitle:@"更多活动"];
}

#pragma mark - 视图初始化
- (void)initializeUserInterface
{
    [self.view addSubview:self.tableView];
}
#pragma mark - 各种Getter
- (MorePlanHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[MorePlanHeaderView alloc]init];
    }
    return _headerView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAINSCRREN_W, MAINSCRREN_H-NAVBAR_H) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = _EEEEEE;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefreshData)];
    }
    return _tableView;
}

#pragma mark - <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}


#pragma mark - 按钮方法

#pragma mark - 自定义方法
- (void)downRefreshData
{
    [self.tableView.mj_header endRefreshing];
}

@end
