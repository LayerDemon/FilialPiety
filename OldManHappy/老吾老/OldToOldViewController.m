//
//  OldToOldViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldToOldViewController.h"

#import "OldToOldHeaderView.h"
//#import "OtoTopView.h"
//#import "OtoFooterView.h"
#import "OldToOldPlanViewCell.h"

#import "OldToOldSectionView.h"



@interface OldToOldViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) OldToOldHeaderView *headerView;

//@property (strong, nonatomic) OtoTopView *topView;
//@property (strong, nonatomic) OtoFooterView *footerView;
//@property (strong, nonatomic) NSMutableArray *listArray;

@end

@implementation OldToOldViewController


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
    [self setIndicatorTitle:@"老吾老"];
}

#pragma mark - 视图初始化
- (void)initializeUserInterface
{
    [self.view addSubview:self.tableView];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
}
#pragma mark - 各种Getter
- (OldToOldHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[OldToOldHeaderView alloc]init];
    }
    return _headerView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAINSCRREN_W, MAINSCRREN_H-NAVBAR_H-TABBAR_H) style:UITableViewStylePlain];
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




//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
////    [_model removeObserver:self forKeyPath:@"historyListData"];
////    [_model removeObserver:self forKeyPath:@"inReadListData"];
//}
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        //        self.hidesBottomBarWhenPushed= YES;
////        self.userDic = [NSDictionary userDic];
//    }
//    return self;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
//
//    [self loadNavBarView];
//    [self initializeDataSource];
//    [self initializeUserInterface];
//    
//}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    
//}
//
//#pragma mark - 数据初始化
//- (void)initializeDataSource
//{
//    self.listArray = [NSMutableArray arrayWithArray:@[@{@"title":@"活动计划",@"domains":@[]},
//                                                      @{@"title":@"我监督的",@"domains":@[]}]];
//    
//    [self startTitleIndicator];
//    [self downRefreshData];
//}
//
//#pragma mark - 视图初始化
//- (void)initializeUserInterface
//{
//    [self.view addSubview:self.tableView];
//}
//
//- (void)loadNavBarView
//{
//    [self setIndicatorTitle:@"老吾老"];
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//}
//
//#pragma mark - 各种getter
//- (OtoTopView *)topView
//{
//    if (!_topView) {
//        _topView = [[OtoTopView alloc]init];
//    }
//    return _topView;
//}
//
//- (OtoFooterView *)footerView
//{
//    if (!_footerView) {
//        _footerView = [[OtoFooterView alloc]init];
//    }
//    return _footerView;
//}
//
//- (UITableView *)tableView
//{
//    if (!_tableView) {
//        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAINSCRREN_W, MAINSCRREN_H-NAVBAR_H-TABBAR_H) style:UITableViewStylePlain];
//        _tableView.dataSource = self;
//        _tableView.delegate = self;
//        _tableView.backgroundColor = _EEEEEE;
//        _tableView.tableHeaderView = self.topView;
//        _tableView.tableFooterView = [[UIView alloc]init];
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefreshData)];
//        //        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefreshData)];
//    }
//    return _tableView;
//}



//#pragma mark - <UITableViewDataSource,UITableViewDelegate>
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.listArray.count;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
////    NSDictionary *tempDic = self.listArray[section];
////    NSArray *bookListArray = tempDic[@"domains"];
//    if (section) {
//        return 0;
//    }
//    return 10;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *identify = @"PlanCell";
//    OldToOldPlanViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
//    if (!cell) {
//        cell = [[OldToOldPlanViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
//    }
//    NSDictionary *tempDic = self.listArray[0];
//    NSArray *bookListArray = tempDic[@"domains"];
//    [cell refreshWithDataDic:bookListArray[0]];
//    
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return FLEXIBLE_NUM(125);
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//    OldToOldSectionView *sectionView = [[OldToOldSectionView alloc]init];
//    [sectionView refreshWithDataDic:self.listArray[section]];
//    return sectionView;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    OldToOldSectionView *sectionView = [[OldToOldSectionView alloc]init];
//    [sectionView refreshWithDataDic:self.listArray[section]];
//    return sectionView.frame.size.height;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    NSArray *noteArray = self.listArray[0][@"bookList"];
//    NSArray *historyArray = self.listArray[1][@"bookList"];
//    if (!YES ||
//        section == 1 ||
//        (noteArray.count+historyArray.count == 0)) {
//        return [[UIView alloc]init];
//    }
//    CGRect superBalnkFrame = self.tableView.frame;
//    superBalnkFrame.size.height = (self.tableView.frame.size.height-self.topView.frame.size.height);
//    CGRect maxFrame = superBalnkFrame;
//    maxFrame.size.height = maxFrame.size.height/2;
//    //    maxFrame.size.width = MAINSCRREN_W;
//    NSInteger count = 0;
//    for (NSDictionary *tempDic in self.listArray) {
//        NSArray *tempArray = tempDic[@"bookList"];
//        count += tempArray.count;
//    }
//    return [UIView listPlaceHolderWithBlankImage:[UIImage imageNamed:@"b_noinread_bg"] ifNecessaryForRowCount:count superBlankFrame:superBalnkFrame maxFrame:maxFrame normalFooterView:nil];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    NSArray *noteArray = self.listArray[0][@"bookList"];
//    NSArray *historyArray = self.listArray[1][@"bookList"];
//    if (NO ||
//        section == 1 ||
//        (noteArray.count+historyArray.count == 0)) {
//        return 0;
//    }
//    
//    
//    CGRect superBalnkFrame = self.tableView.frame;
//    superBalnkFrame.size.height = (self.tableView.frame.size.height-self.topView.frame.size.height);
//    CGRect maxFrame = superBalnkFrame;
//    maxFrame.size.height = maxFrame.size.height/2;
//    //    maxFrame.size.width = MAINSCRREN_W;
//    NSInteger count = 0;
//    for (NSDictionary *tempDic in self.listArray) {
//        NSArray *tempArray = tempDic[@"bookList"];
//        count += tempArray.count;
//    }
//    
//    return [UIView listPlaceHolderWithBlankImage:[UIImage imageNamed:@"b_noinread_bg"] ifNecessaryForRowCount:count superBlankFrame:superBalnkFrame maxFrame:maxFrame normalFooterView:nil].frame.size.height;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
////    ReadBookPlanViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
////    RbPlanDetailViewController  *planDetailVC = [[RbPlanDetailViewController alloc]init];
////    planDetailVC.userPlanStatus = 0;
////    planDetailVC.isNewTopic = cell.isNewTopic;//有新的主题
////    planDetailVC.planDetailDic = cell.dataDic;
////    planDetailVC.userPlanInfoDic = cell.userPlanInfoDic;
////    
////    
////    [self.navigationController pushViewController:planDetailVC animated:YES];
//}
//
//#pragma mark - 按钮方法
//
//#pragma mark - 自定义方法
////下拉刷新
//- (void)downRefreshData
//{
//    [self stopTitleIndicator];
//    [self.tableView.mj_footer resetNoMoreData];
//    [self.tableView.mj_footer endRefreshing];
//    [self.tableView.mj_header endRefreshing];
//    [self readBookDataParse];
////    [FRIENDCACHE_MANAGER friendListCacheWithCompleted:^(id responseObject, NSError *error) {
////        if (!error) {
////            NSArray *friendListArray = responseObject;
////            NSMutableArray *tempArray = [NSMutableArray array];
////            for (NSDictionary *friendDic in friendListArray) {
////                if (friendDic[@"uid"]) {
////                    [tempArray addObject:friendDic[@"uid"]];
////                }
////                if (friendDic[@"id"]) {
////                    [tempArray removeObject:friendDic[@"id"]];
////                    [tempArray addObject:friendDic[@"id"]];
////                }
////            }
////            NSString *coberUidsStr = [tempArray componentsJoinedByString:@","];
////            coberUidsStr = [NSString isBlankStringWithString:coberUidsStr] ? @"" : coberUidsStr;
////            [self.model getReadBookDataWithCobberUids:coberUidsStr];
////        }else{
////            [self stopTitleIndicator];
////            [self.tableView.mj_footer endRefreshing];
////            [self.tableView.mj_header endRefreshing];
////            [AppDelegate showHintLabelWithMessage:@"获取好友列表失败~"];
////        }
////    }];
//}
//
//////上拉加载
////- (void)upRefreshData
////{
////    if (!self.model.readBookData) {
////        [AppDelegate showHintLabelWithMessage:@"正在获取在读列表~"];
////        [self.tableView.mj_footer endRefreshing];
////        return;
////    }
////    self.currentPage++;
////
////    NSArray *tempArray = self.model.readBookData[@"domains"];
////    if (!tempArray) {
////        tempArray = @[];
////    }
////
////    NSMutableArray *bookIdsArray = [NSMutableArray array];
////    for (NSDictionary *tempDic in tempArray) {
////        if (tempDic[@"bookId"]) {
////            [bookIdsArray addObject:tempDic[@"bookId"]];
////        }
////    }
////    NSString *bookIdsString = [bookIdsArray componentsJoinedByString:@","];
////    bookIdsString = [NSString isBlankStringWithString:bookIdsString] ? @"" : bookIdsString;
////
//////    [self.model getHistoryListDataWithUid:self.userDic[@"id"] bookIds:bookIdsString pageIndex:self.currentPage pageSize:PAGESIZE_NORMAL];
////}
//
//#pragma mark - 数据处理
//- (void)readBookDataParse
//{
//    [self stopTitleIndicator];
//    [self.tableView.mj_footer endRefreshing];
//    [self.tableView.mj_header endRefreshing];
//    NSString *readBookJsonStr = @"{\"bookPlanPojos\":[{\"bookId\":57,\"bookPlanUserPojos\":[],\"title\":\"游戏改变世界\",\"image\":\"http://img3.douban.com/lpic/s11136690.jpg\",\"bookPlanUserPojo\":{\"totalPages\":\"345\",\"pages\":\"0\",\"notesCount\":0,\"isRemind\":1,\"progressTime\":\"2016-10-26 17:09:58\"},\"bookUid\":2,\"bookPlanUserCount\":0,\"bookPlanId\":26}],\"bookPlanRemindPojo\":{\"status\":0}}";
//    
//    NSDictionary *readBookData = [readBookJsonStr objectFromJSONString];
//    
//    NSArray *tempArray = readBookData[@"bookPlanPojos"];
//    if (!tempArray) {
//        tempArray = @[];
//    }
//    NSDictionary *inReadDic = @{@"title":@"活动计划",@"domains":tempArray,@"bookPlanRemindPojo":readBookData[@"bookPlanRemindPojo"]};
//    [self.listArray replaceObjectAtIndex:0 withObject:inReadDic];
//    [self.tableView reloadData];
//    
//    if (!tempArray.count) {
////        ReadBookZeroView *zeroView = [[ReadBookZeroView alloc]init];
////        self.tableView.tableFooterView = zeroView;
////        [zeroView startTotalCountAnimation];
//        //        self.tableView.bounces = NO;
//    }else{
//        
//        //        self.tableView.bounces = YES;
//        self.tableView.tableFooterView = self.footerView;
//    }
//    
//    [self.tableView reloadData];
//}
//
//#pragma mark - 通知方法
//- (void)refreshReadBookListData:(NSNotification *)notif
//{
//    [self downRefreshData];
//}
//
//- (void)updateRemindTime:(NSNotification *)notif
//{
//    NSDictionary *notifDic = notif.object;
//    if (!notifDic) {
//        return;
//    }
//    
//    NSDictionary *inReadDic = [self.listArray firstObject];
//    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:inReadDic];
//    [tempDic setObject:notifDic forKey:@"bookPlanRemindPojo"];
//    [self.listArray replaceObjectAtIndex:0 withObject:tempDic];
//    [self.tableView reloadData];
//}
//
//- (void)updateIsReadPlanData:(NSNotification *)notif
//{
//    NSDictionary *planDic = notif.object;
//    if (planDic) {
//        NSMutableDictionary *bookPlanListDic = [NSMutableDictionary dictionaryWithDictionary:[self.listArray firstObject]];
//        NSMutableArray *bookPlanArray = [NSMutableArray arrayWithArray:bookPlanListDic[@"domains"]];
//        //筛选出当前planDic.去掉更新用户
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"bookPlanId == %@", planDic[@"bookPlanId"]];
//        NSArray *filteredArray = [bookPlanArray filteredArrayUsingPredicate:predicate];
//        if (filteredArray.count) {
//            NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:[filteredArray firstObject]];
//            NSInteger index = [bookPlanArray indexOfObject:tempDic];
//            [tempDic setObject:@[] forKey:@"bookPlanUserPojos"];
//            [bookPlanArray replaceObjectAtIndex:index withObject:tempDic];
//            [bookPlanListDic setObject:bookPlanArray forKey:@"domains"];
//            [self.listArray replaceObjectAtIndex:0 withObject:bookPlanListDic];
//            [self.tableView reloadData];
//        }
//    }else{
//        [self downRefreshData];
//    }
//}

@end
