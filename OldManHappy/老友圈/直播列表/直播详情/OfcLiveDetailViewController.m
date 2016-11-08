//
//  OfcLiveDetailViewController.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OfcLiveDetailViewController.h"
#import "OfcldHeaderView.h"
#import "OfcldBottomView.h"

@interface OfcLiveDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) OfcldHeaderView *headerView;
@property (strong, nonatomic) OfcldBottomView *bottomView;

@end

@implementation OfcLiveDetailViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    [self initializeDataSource];
    [self initializeUserInterface];
}

#pragma mark - 数据初始化
- (void)initializeDataSource
{
    
}

#pragma mark - 视图初始化
- (void)initializeUserInterface
{
    [self setIndicatorTitle:@"视频直播"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
}
#pragma mark - 各种Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAINSCRREN_W, MAINSCRREN_H-NAVBAR_H-self.bottomView.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefreshData)];
        
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upLoadMoreData)];
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.tableHeaderView = self.headerView;
    }
    return _tableView;
}

- (OfcldHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[OfcldHeaderView alloc]init];
    }
    return _headerView;
}

- (OfcldBottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[OfcldBottomView alloc]init];
        [_bottomView setOriginY:MAINSCRREN_H-NAVBAR_H-_bottomView.frame.size.height];
    }
    return _bottomView;
}

#pragma mark - <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}


#pragma mark - 按钮方法

#pragma mark - 自定义方法
- (void)downRefreshData
{
    [self performSelector:@selector(endRefreshData) withObject:nil afterDelay:3];
}

- (void)upLoadMoreData
{
    [self performSelector:@selector(endRefreshData) withObject:nil afterDelay:3];
}

- (void)endRefreshData
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


@end
