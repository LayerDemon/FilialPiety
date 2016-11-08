//
//  AboutUSViewController.m
//  马上到
//
//  Created by zhangyi on 16/2/23.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "AboutUSViewController.h"

@interface AboutUSViewController ()


- (void)initializeDataSource;
- (void)initializeUserInterface;

@end

@implementation AboutUSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"中心简介";
        self.hidesBottomBarWhenPushed =YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * logoImageView = [[UIImageView alloc] init];
    logoImageView.image = [UIImage imageNamed:@"icon"];
    [self.view addSubview:logoImageView];
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@80);
        make.centerX.equalTo(self.view);
        make.top.equalTo(@30);
    }];
    

    UILabel * titleLabel = [UILabel createLabelWithText:@"老吾老" font:17 subView:self.view];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(200, 30));
        make.centerX.equalTo(self.view);
        make.top.equalTo(logoImageView.bottom).offset(10);
    }];
    
    
    UILabel * contentLabel = [UILabel createLabelWithText:@"    秉承传统中华孝文化核心，“老吾老”老年人活动中心应运而生，创新建立社区“居家养老”新模式。\n “老吾老”老年人活动中心始终坚持“孝为先，诚相待”，通过融合日常“孝心”“诚心”“真心”“耐心”“细心”的五心服务，和科技医疗、养生健康、邻里居家、文化娱乐的特色服务，致力于为老年人提供一个休闲、娱乐、交流、活动的平台，促进构建和谐社区；致力于向社会持续倡导中华孝文化，努力实现老有所养、老有所医、老有所教、老有所学、老有所为、老有所乐，促进老龄事业更好发展。" font:14 subView:self.view];
    contentLabel.numberOfLines = 0;
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.width.equalTo(@(NOW_SCR_W- 30));
        make.top.equalTo(titleLabel.bottom).offset(@15);
    }];
    
}


#pragma mark -- create label
- (UILabel *)createLabelWithText:(NSString *)text font:(CGFloat)font subView:(UIView *)subView
{
    UILabel * label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    label.font = [UIFont systemFontOfSize:font];
    [subView addSubview:label];
    return label;
}

#pragma mark -- create button 
- (UIButton *)createButtonWithTitle:(NSString *)title font:(CGFloat)font subView:(UIView *)subView
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setTitle:title forState:UIControlStateNormal];
    [subView addSubview:button];
    return button;
}

#pragma mark -- create view
- (UIView *)createViewWithBackColor:(UIColor *)color subView:(UIView *)subView
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = color;
    [subView addSubview:view];
    return view;
}

@end
