//
//  HappyLifeViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "HappyLifeViewController.h"
#import "HappyLifeListViewController.h"

#import "CleanDetailViewController.h"

#define BUTTON_TAG 1000

@interface HappyLifeViewController ()


@end

@implementation HappyLifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"悦生活";
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
    self.view.backgroundColor = THEMECOLOR_BG;
    
    //线上商城
    UIView * mallOnLineView = [self createTypeViewWithTitle:@"线上商城" detail:@"低价，促销，抢购" buttonTitleArray:@[@"保健器材",@"营养套餐",@"有机蔬菜",@"家电厨具",@"日常用品"] baseTag:BUTTON_TAG];
    
    [mallOnLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
    }];
    
    //家政服务
    UIView * familySericeView = [self createTypeViewWithTitle:@"家政服务" detail:@"" buttonTitleArray:@[@"维修服务",@"清洁服务",@"保养服务",@"陪伴服务"] baseTag:BUTTON_TAG + 100];
    
    [familySericeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mallOnLineView.bottom).offset(@10);
    }];
    
    //医疗健康
    UIView * healthView = [self createTypeViewWithTitle:@"医疗健康" detail:@"" buttonTitleArray:@[@"专家咨询",@"门店理疗",@"特殊护理"] baseTag:BUTTON_TAG + 200];
    
    [healthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(familySericeView.bottom).offset(@10);
    }];
    
    //营养计划
    UIView * planView = [self createTypeViewWithTitle:@"营养计划" detail:@"" buttonTitleArray:@[@"历史营养计划"] baseTag:BUTTON_TAG + 300];
    
    [planView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(healthView.bottom).offset(@10);
    }];
    
    //跑腿服务
    UIView * runView = [self createTypeViewWithTitle:@"跑腿服务" detail:@"" buttonTitleArray:@[@"代理跑腿",@"代理购物"] baseTag:BUTTON_TAG + 400];
    
    [runView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(planView.bottom).offset(@10);
    }];
    
    ((UIScrollView *)self.view).contentSize = CGSizeMake(NOW_SCR_W, 180 * 5);
}


- (UIView *)createTypeViewWithTitle:(NSString *)title detail:(NSString *)detail buttonTitleArray:(NSArray *)buttonTitleArray baseTag:(NSInteger)baseTag
{
    UIView * totalView = [[UIView alloc] init];
    totalView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:totalView];
    
    [totalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.width.equalTo(@(NOW_SCR_W));
        make.height.equalTo(@(170));
    }];
    
    UILabel * titleLabel = [UILabel createLabelWithText:title font:0 subView:totalView];
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [totalView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.height.equalTo(@40);
        make.top.equalTo(@5);
        make.width.equalTo(@150);
    }];
    
    UIScrollView * buttonScrollView = [[UIScrollView alloc] init];
    buttonScrollView.showsHorizontalScrollIndicator = NO;
    [totalView addSubview:buttonScrollView];
    
    [buttonScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(titleLabel.bottom);
        make.height.equalTo(@120);
    }];
    
    buttonScrollView.contentSize = CGSizeMake(10 + 110 * buttonTitleArray.count, 100);
    
    for (int i = 0; i < buttonTitleArray.count ; i ++) {
        UIButton * toolButton = [UIButton buttonWithType:UIButtonTypeCustom];
        toolButton.backgroundColor = THEMECOLOR_BG;
        [toolButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        toolButton.tag = baseTag + i;
        [buttonScrollView addSubview:toolButton];
        
        [toolButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(@100);
            make.top.equalTo(@10);
            make.left.equalTo(@(10 + 110 * i));
        }];
        
        UILabel * toolTitle = [UILabel createLabelWithText:buttonTitleArray[i] font:13 subView:toolButton];
        [toolButton addSubview:toolTitle];
        
        [toolTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@5);
            make.height.equalTo(@25);
            make.width.equalTo(@100);
        }];
        
        UIImageView * toolImageView = [[UIImageView alloc] init];
        toolImageView.clipsToBounds = YES;
        toolImageView.contentMode = UIViewContentModeScaleAspectFill;
        toolImageView.image = [UIImage imageNamed:buttonTitleArray[i]];
        [toolButton addSubview:toolImageView];
        
        [toolImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(@70);
            make.right.bottom.equalTo(@0);
        }];
    }
    
    return totalView;
}


#pragma mark -- button pressed
- (void)buttonPressed:(UIButton *)sender
{
    NSInteger type = (sender.tag - BUTTON_TAG) / 100;
    
    NSInteger index = (sender.tag - BUTTON_TAG) % 100;
    
    switch (type) {
        case 0:
        {
            if (index == 0) {
                HappyLifeListViewController * happyLifeVC = [[HappyLifeListViewController alloc] initWithTitle:@"健身器材"];
                [self.navigationController pushViewController:happyLifeVC animated:YES];
            }else{
                NSArray * titleArray = @[@"营养套餐",@"有机蔬菜",@"家电厨具",@"日常用品"];
                CleanDetailViewController * cleanVC = [[CleanDetailViewController alloc] initWithTitle:titleArray[index - 1]];
                [self.navigationController pushViewController:cleanVC animated:YES];
            }
        }
            break;
        case 1:
        {
            NSArray * titleArray = @[@"维修服务",@"清洁服务",@"保养服务",@"陪伴服务"];
            CleanDetailViewController * cleanVC = [[CleanDetailViewController alloc] initWithTitle:titleArray[index]];
            [self.navigationController pushViewController:cleanVC animated:YES];
        }
            break;
        case 2:
        {
            NSArray * titleArray = @[@"专家咨询",@"门店理疗",@"特殊护理"];
            CleanDetailViewController * cleanVC = [[CleanDetailViewController alloc] initWithTitle:titleArray[index]];
            [self.navigationController pushViewController:cleanVC animated:YES];
        }
            break;
        case 3:
        {
            CleanDetailViewController * cleanVC = [[CleanDetailViewController alloc] initWithTitle:@"历史营养计划"];
            [self.navigationController pushViewController:cleanVC animated:YES];
        }
            break;
        case 4:
        {
            NSArray * titleArray = @[@"代理跑腿",@"代理购物"];
            CleanDetailViewController * cleanVC = [[CleanDetailViewController alloc] initWithTitle:titleArray[index]];
            [self.navigationController pushViewController:cleanVC animated:YES];

        }
            break;
            
        default:
            break;
    }
    
}

@end
