//
//  OfcLiveViewController.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OfcLiveViewController.h"
#import "OfcLiveViewCell.h"

#import "OfcLiveDetailViewController.h"

@interface OfcLiveViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation OfcLiveViewController

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
    [self.view addSubview:self.tableView];
}
#pragma mark - 各种Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAINSCRREN_W, MAINSCRREN_H-NAVBAR_H-TABBAR_H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefreshData)];
        
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upLoadMoreData)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

#pragma mark - <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"ArticleCell";
    OfcLiveViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[OfcLiveViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    [cell refreshWithDataDic:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OfcLiveViewCell *cell = [[OfcLiveViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Frame"];
    [cell refreshWithDataDic:nil];
    return cell.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OfcLiveDetailViewController *liveDetailVC = [[OfcLiveDetailViewController alloc]init];
    [self.navigationController pushViewController:liveDetailVC animated:YES];
}

#pragma mark - 按钮方法

#pragma mark - 自定义方法
- (void)downRefreshData
{

}

- (void)upLoadMoreData
{
    
}


@end
