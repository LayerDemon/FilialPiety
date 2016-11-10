//
//  HappyLifeListViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "HappyLifeListViewController.h"
#import "HappyLifeListTableViewCell.h"

#import "HappyListDetailViewController.h"

@interface HappyLifeListViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView       * tableView;
@property (strong, nonatomic) NSMutableArray    * storeListArray;


@property (strong, nonatomic) NSMutableArray    * dataArray;


@end

@implementation HappyLifeListViewController

static NSString * identify = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.navigationItem.title = title;
    }
    return self;
}

#pragma mark -- initialize
- (void)initializeDataSource
{

    
}

- (void)initializeUserInterface
{
    self.view.backgroundColor = THEMECOLOR_BACKGROUND;
    
    _tableView = ({
        UITableView * tableView = [[UITableView alloc] init];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.rowHeight = 125;
        tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:tableView];
        tableView;
    });

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.bottom.equalTo(@-49);
    }];
}

#pragma mark -- <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identify = @"identify";
    HappyLifeListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[HappyLifeListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    NSInteger index = indexPath.row % 4 + 1;
    
    cell.userImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"健身器材%ld",index]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HappyListDetailViewController * happListDetailVC = [[HappyListDetailViewController alloc] initWithIndex:indexPath.row % 4 + 1];
    [self.navigationController pushViewController:happListDetailVC animated:YES];
}

@end
