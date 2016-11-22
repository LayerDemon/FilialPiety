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
#import "AppointViewController.h"

#import "NewsScrollView.h"

#import "NewHappyViewController.h"

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
    
    NSArray * imageArray = [NSArray arrayWithObjects:@"广告1",@"广告2",@"广告3", nil];
    
    NewsScrollView * topScrollView = [[NewsScrollView alloc] initWithFrame:CGRectMake(0, 0, NOW_SCR_W, 200) dataSource:imageArray];
    topScrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:topScrollView];
    
    //线上商城
    UIView * mallOnLineView = [self createTypeViewWithTitle:@"线上商城" detail:@"低价，促销，抢购" buttonTitleArray:@[@"保健器材",@"营养套餐",@"有机蔬菜",@"家电厨具",@"日常用品"] baseTag:BUTTON_TAG];
    
    [mallOnLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@150);
    }];
    
    //家政服务
    UIView * familySericeView = [self createTypeViewWithTitle:@"家政服务" detail:@"" buttonTitleArray:@[@"维修服务",@"清洁服务",@"保养服务",@"陪伴服务"] baseTag:BUTTON_TAG + 100];
    
    [familySericeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@150);
    }];
    
    //医疗健康
    UIView * healthView = [self createTypeViewWithTitle:@"医疗健康" detail:@"" buttonTitleArray:@[@"专家咨询",@"门店理疗",@"特殊护理"] baseTag:BUTTON_TAG + 200];
    
    [healthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(familySericeView.bottom).offset(@10);
    }];
    
//    //营养计划
//    UIView * planView = [self createTypeViewWithTitle:@"营养计划" detail:@"" buttonTitleArray:@[@"历史营养计划"] baseTag:BUTTON_TAG + 300];
//    
//    [planView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(healthView.bottom).offset(@10);
//    }];
//    
//    //跑腿服务
//    UIView * runView = [self createTypeViewWithTitle:@"跑腿服务" detail:@"" buttonTitleArray:@[@"代理跑腿",@"代理购物"] baseTag:BUTTON_TAG + 400];
//    
//    [runView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(planView.bottom).offset(@10);
//    }];
//    
    ((UIScrollView *)self.view).contentSize = CGSizeMake(NOW_SCR_W, 180 * 2 + 150);
    
    if (180 * 2 + 150 < NOW_SCR_H) {
         ((UIScrollView *)self.view).contentSize = CGSizeMake(NOW_SCR_W, NOW_SCR_H);
    }
    
//    NSArray * titleArray = [NSArray arrayWithObjects:@"家政服务",@"医疗健康",@"营养计划",@"跑腿服务", nil];
//    for (int i = 0; i < titleArray.count; i ++) {
//        UIButton * button = [self createButtonWithTitle:titleArray[i] imageName:titleArray[i]];
//    
//        [button addTarget:self action:@selector(happyButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        button.tag = BUTTON_TAG + i;
//        
//        [button mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(@(NOW_SCR_W/3.0 * (i % 3)));
//            make.top.equalTo(@(210 + NOW_SCR_W/3.0 * 0.8 * (i / 3)));
//        }];
//    }
    
    
}


- (UIButton *)createButtonWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = _COLOR(230, 230, 230, 1);
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(NOW_SCR_W/3.0 - 1));
        make.height.equalTo(@(NOW_SCR_W/3.0 * 0.8 - 1));
    }];
    
    UIView * bgView = [[UIView alloc] init];
    bgView.userInteractionEnabled = NO;
    bgView.layer.cornerRadius = 5;
    bgView.backgroundColor = _COLOR(arc4random()%255, arc4random()%255, arc4random()%255, 1);
    [button addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(button.width).multipliedBy(0.65);
        make.height.equalTo(button).multipliedBy(0.65);
        make.centerX.equalTo(button);
        make.centerY.equalTo(button).offset(@-5);
    }];
    
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@new",imageName]];
    [bgView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@40);
        make.center.equalTo(bgView);
    }];
    
    UILabel * titleLabel = [UILabel createLabelWithText:title font:15 subView:button];
    titleLabel.textColor = [UIColor darkGrayColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.equalTo(button);
        make.bottom.equalTo(@0);
        make.height.equalTo(@20);
    }];
    
    return button;
}


#pragma mark -- button pressed
- (void)happyButtonPressed:(UIButton *)sender
{
    NSInteger index = sender.tag - BUTTON_TAG;
    
    NSArray * titleArray = [NSArray arrayWithObjects:@"家政服务",@"医疗健康",@"营养计划",@"跑腿服务", nil];
    
    NSArray * jiazArray = @[@"维修服务",@"清洁服务",@"保养服务",@"陪伴服务"];
    NSArray * yilArray = @[@"专家咨询",@"门店理疗",@"特殊护理"];
    NSArray * yinyArray = @[@"历史营养计划"];
    NSArray * paotuiArray = @[@"代理跑腿",@"代理购物"];
    
    NSArray * dataArray = @[jiazArray,yilArray,yinyArray,paotuiArray];
    
    NewHappyViewController * newVC = [[NewHappyViewController alloc] initWithTitle:titleArray[index] childArray:dataArray[index]];
    [self.navigationController pushViewController:newVC animated:YES];
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
        toolImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",buttonTitleArray[i]]];
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
//            if (index == 0) {
//                HappyLifeListViewController * happyLifeVC = [[HappyLifeListViewController alloc] initWithTitle:@"健身器材"];
//                [self.navigationController pushViewController:happyLifeVC animated:YES];
//            }else{
//                NSArray * titleArray = @[@"营养套餐",@"有机蔬菜",@"家电厨具",@"日常用品"];
//                CleanDetailViewController * cleanVC = [[CleanDetailViewController alloc] initWithTitle:titleArray[index - 1]];
//                [self.navigationController pushViewController:cleanVC animated:YES];
//            }
        }
            break;
        case 1:
        {
            NSArray * titleArray = @[@"维修服务",@"清洁服务",@"保养服务",@"陪伴服务"];
            
            if (index == 1) {
                AppointViewController *appointVC = [[AppointViewController alloc] initWithTitle:titleArray[index]];
                [self.navigationController pushViewController:appointVC animated:YES];
                return;
            }
            
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
