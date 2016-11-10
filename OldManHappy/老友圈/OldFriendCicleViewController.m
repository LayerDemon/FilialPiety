//
//  OldFriendCicleViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldFriendCicleViewController.h"
#import "DLCustomSlideView.h"
#import "DLScrollTabbarView.h"
#import "DLLRUCache.h"

#import "OfcLiveViewController.h"

#import "HappyLifeListViewController.h"
#import "OldFriendDetailViewController.h"
#import "CleanDetailViewController.h"

@interface OldFriendCicleViewController ()<DLCustomSlideViewDelegate>

@property (strong, nonatomic) DLCustomSlideView *slideView;
//@property (strong, nonatomic) UIView *headerView;

@property (strong, nonatomic) NSMutableArray *itemArray;

@end

@implementation OldFriendCicleViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadNavBarView];
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
    [self.view addSubview:self.slideView];
    
    self.automaticallyAdjustsScrollViewInsets = NO; // 如果你使用了UITabBarController, 系统会自动调整scrollView的inset。加上这个如果出错的话。
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    DLScrollTabbarView *tabbar = [[DLScrollTabbarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, FLEXIBLE_NUM(34))];
    tabbar.tabItemNormalColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    tabbar.tabItemSelectedColor = [UIColor colorWithRed:51/255.0 green:178/255.0 blue:114/255.0 alpha:1];
    tabbar.tabItemNormalFontSize = FLEXIBLE_NUM(14);
    tabbar.trackColor = [UIColor colorWithRed:51/255.0 green:178/255.0 blue:114/255.0 alpha:1];
    
    NSString *systemStr = @"保健器材，营养套餐，有机素菜，家电器具，日常用品";
    NSArray *itemTitles = [systemStr componentsSeparatedByString:@"，"];
    self.itemArray = [NSMutableArray array];
    for (int i=0; i<itemTitles.count; i++) {
        DLScrollTabbarItem *item= [DLScrollTabbarItem itemWithTitle:itemTitles[i] width:FLEXIBLE_NUM(80)];
        [self.itemArray addObject:item];
    }
    tabbar.tabbarItems = self.itemArray;
    tabbar.backgroundColor = [UIColor whiteColor];
    self.slideView.tabbar = tabbar;
    DLLRUCache *cache = [[DLLRUCache alloc] initWithCount:self.itemArray.count];
    self.slideView.cache = cache;
    self.slideView.tabbarBottomSpacing = FLEXIBLE_NUM(6);
    self.slideView.baseViewController = self;
    [self.slideView setup];
    self.slideView.selectedIndex = 0;
    
    NSInteger button_w = 60;
    UIButton * carButton = [UIButton buttonWithType:UIButtonTypeCustom];
    carButton.backgroundColor = THEMECOLOR_TINT;
    carButton.layer.cornerRadius = button_w/2;
    carButton.clipsToBounds = YES;
    [carButton setImage:[UIImage imageNamed:@"购物车"] forState:UIControlStateNormal];
    [carButton addTarget:self action:@selector(carButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:carButton];
    
    [carButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@(button_w));
        make.bottom.equalTo(@-60);
        make.right.equalTo(@-10);
    }];
}

- (void)loadNavBarView
{
    [self setIndicatorTitle:@"购健康"];
//    self.navigationItem.titleView = self.slideView.tabbar;
}

#pragma mark -- button pressed
- (void)carButtonPressed:(UIButton *)sender
{
    CleanDetailViewController * cleanVC = [[CleanDetailViewController alloc] initWithTitle:@"购物车"];
    [self.navigationController pushViewController:cleanVC animated:YES];
}

#pragma mark - 各种Getter
- (DLCustomSlideView *)slideView
{
    if (!_slideView) {
        _slideView = [[DLCustomSlideView alloc]initWithFrame:CGRectMake(0,0, MAINSCRREN_W, MAINSCRREN_H-NAVBAR_H)];
        _slideView.delegate = self;
        _slideView.backgroundColor = _EEEEEE;
    }
    return _slideView;
}

#pragma mark - <DLCustomSlideViewDelegate>
- (NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender{
    return self.itemArray.count;
}

- (UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index{
    if (index == 0) {
        HappyLifeListViewController * happyLifeVC = [[HappyLifeListViewController alloc] initWithTitle:@"健身器材"];
        return happyLifeVC;
    }else{
        NSArray * titleArray = @[@"营养套餐",@"有机蔬菜",@"家电厨具",@"日常用品"];
        OldFriendDetailViewController * cleanVC = [[OldFriendDetailViewController alloc] initWithTitle:titleArray[index-1]];
        return cleanVC;
    }

}

#pragma mark - 按钮方法
- (void)rightItemPressed:(UIButton *)sender
{
    
}

#pragma mark - 自定义方法



@end
