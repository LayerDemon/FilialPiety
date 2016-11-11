//
//  HappyListDetailViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "HappyListDetailViewController.h"

@interface HappyListDetailViewController ()

@property (assign, nonatomic) NSInteger     selectIndex;

@end

@implementation HappyListDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}

- (instancetype)initWithIndex:(NSInteger)index
{
    self = [super init];
    if (self) {
        _selectIndex = index;
        self.navigationItem.title = @"商品详情";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)dealloc
{
    
}

#pragma mark -- initialize
- (void)initializeDataSource
{
    
}

- (void)initializeUserInterface
{
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"健身器材%ld详情",(long)_selectIndex]];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.width.equalTo(@(NOW_SCR_W));
        make.height.equalTo(@(NOW_SCR_H - 64));
    }];
}


@end
