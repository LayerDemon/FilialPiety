//
//  OldFriendViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/24.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldFriendViewController.h"

#import "OldFriendBuyViewController.h"

#define Button_TAG 109

@interface OldFriendViewController ()

@end

@implementation OldFriendViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"购健康";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
}

- (void)initializeUserInterface
{
    NSArray * titleArray = @[@"土鸡蛋",@"土鸡",@"蜂蜜",@"农村山货",@"有机蔬菜"];
    NSArray * colorArray = @[_COLOR(164, 196, 0, 1),_COLOR(0, 195, 114, 1)];
    
    for (int i = 0; i < titleArray.count; i ++) {
        UIButton * button = [self createViewWithTitle:titleArray[i] buttonColor:colorArray[i % 2] top:i * 105];
        button.tag = Button_TAG + i;
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark -- button pressed
- (void)buttonPressed:(UIButton *)sender
{
    NSInteger index = sender.tag - Button_TAG;
    NSArray * titleArray = @[@"土鸡蛋",@"土鸡",@"蜂蜜",@"农村山货",@"有机蔬菜"];
    OldFriendBuyViewController * oldBuyVC = [[OldFriendBuyViewController alloc] initWithTitle:titleArray[index]];
    [self.navigationController pushViewController:oldBuyVC animated:YES];

}

- (UIButton *)createViewWithTitle:(NSString *)title buttonColor:(UIColor *)color top:(CGFloat)top
{
    UIView * view = [[UIView alloc] init];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(top));
        make.left.equalTo(@0);
        make.width.equalTo(@(NOW_SCR_W));
        make.height.equalTo(@100);
    }];
    
    UIImageView * showImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:title]];
    showImageView.contentMode = UIViewContentModeScaleAspectFit;
    showImageView.clipsToBounds = YES;
    [view addSubview:showImageView];
    [showImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.width.equalTo(@(NOW_SCR_W - 120));
        make.top.bottom.equalTo(@0);
    }];
    
    UIView * leftView = [[UIView alloc] init];
    leftView.backgroundColor = color;
    [view addSubview:leftView];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(120, 100));
        make.top.equalTo(@0);
        make.right.equalTo(@0);
    }];
    
    UILabel * titleLabel = [UILabel createLabelWithText:title font:25 subView:leftView];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.top.right.equalTo(@0);
        make.height.equalTo(@60);
    }];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"预定"] forState:UIControlStateNormal];
    [leftView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.bottom.equalTo(@-15);
        make.height.equalTo(25);
    }];
 
    
    
    return button;
}


@end
