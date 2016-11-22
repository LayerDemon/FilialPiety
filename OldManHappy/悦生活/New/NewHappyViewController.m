//
//  NewHappyViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/11.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "NewHappyViewController.h"
#import "NewsScrollView.h"
#import "CleanDetailViewController.h"

#define Button_tag 1200
@interface NewHappyViewController ()

@property (strong, nonatomic) NSArray       * childArray;

@end

@implementation NewHappyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}

- (instancetype)initWithTitle:(NSString *)title childArray:(NSArray *)childArray
{
    self = [super init];
    if (self) {
        self.childArray = childArray;
        self.navigationItem.title = title;
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
    self.view.backgroundColor = THEMECOLOR_BG;
    
    NSArray * imageArray = [NSArray arrayWithObjects:@"广告1",@"广告2",@"广告3", nil];
    
    NewsScrollView * topScrollView = [[NewsScrollView alloc] initWithFrame:CGRectMake(0, 0, NOW_SCR_W, 200) dataSource:imageArray];
    topScrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:topScrollView];
 
    NSArray * titleArray = [NSArray arrayWithObjects:@"家政服务",@"医疗健康",@"营养计划",@"跑腿服务", nil];
    
    for (int i = 0; i < _childArray.count; i ++) {
        UIButton * button = [self createButtonWithTitle:_childArray[i] imageName:titleArray[i]];
        button.tag = Button_tag + i;
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(NOW_SCR_W/3.0 * (i % 3)));
            make.top.equalTo(@(210 + NOW_SCR_W/3.0 * 0.8 * (i / 3)));
        }];
    }
    
    
}

#pragma mark -- button pressed
- (void)buttonPressed:(UIButton *)sender
{
    NSInteger index = sender.tag - Button_tag;
    CleanDetailViewController * cleanVC = [[CleanDetailViewController alloc] initWithTitle:_childArray[index]];
    [self.navigationController pushViewController:cleanVC animated:YES];

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



@end
