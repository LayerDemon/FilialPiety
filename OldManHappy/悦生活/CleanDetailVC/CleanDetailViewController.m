//
//  CleanDetailViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "CleanDetailViewController.h"

@interface CleanDetailViewController ()

@property (strong, nonatomic) NSString          * titleString;

@end

@implementation CleanDetailViewController

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
}

@end
