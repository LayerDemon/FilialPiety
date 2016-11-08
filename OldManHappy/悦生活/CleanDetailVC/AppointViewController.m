//
//  AppointViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "AppointViewController.h"
#import "CleanDetailViewController.h"

@interface AppointViewController ()


@property (strong, nonatomic) NSString          * titleString;

@end

@implementation AppointViewController

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _titleString = title;
        self.navigationItem.title = title;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
}

- (void)initializeUserInterface
{
    self.view.backgroundColor = THEMECOLOR_BG;
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@详情",_titleString]];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.width.equalTo(@(NOW_SCR_W));
        make.height.equalTo(@(NOW_SCR_H - 64));
    }];
    
    UIButton * appointButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [appointButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    appointButton.backgroundColor = [UIColor clearColor];
    [self.view addSubview:appointButton];
    
    [appointButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.width.equalTo(@(NOW_SCR_W-40));
        make.bottom.equalTo(@(NOW_SCR_H - 64 - 20));
        make.height.equalTo(@60);
    }];
}

- (void)buttonPressed:(UIButton *)sender
{
    CleanDetailViewController * cleanVC = [[CleanDetailViewController alloc] initWithTitle:@"预约清洁服务"];
    [self.navigationController pushViewController:cleanVC animated:YES];
}

@end
