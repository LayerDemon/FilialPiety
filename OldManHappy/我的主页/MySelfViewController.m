//
//  MySelfViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "MySelfViewController.h"

#define FamilyBut_TAG 400
@interface MySelfViewController ()

@property (strong, nonatomic) UIImageView           * topBGImageView;
@property (strong, nonatomic) UIImageView           * userImageView;
@property (strong, nonatomic) UILabel               * userNameLabel;
@property (strong, nonatomic) UILabel               * addressLabel;
@property (strong, nonatomic) UILabel               * mottoLabel;


@end

@implementation MySelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}

- (void)dealloc
{
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"我的";
    }
    return self;
}

/**
 隐藏navigationbar
 
 @param animated 设置后，左侧边缘返回更自然
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.navigationController.navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}


#pragma mark -- initialize
- (void)initializeDataSource
{
    
}

- (void)initializeUserInterface
{
    self.view.backgroundColor = THEMECOLOR_BG;
    
    _topBGImageView = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = [UIImage imageNamed:@"头像.jpg"];
        imageView.userInteractionEnabled = YES;
        imageView.clipsToBounds = YES;
        [self.view addSubview:imageView];
        imageView;
    });
    [_topBGImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.width.equalTo(self.view);
        make.height.equalTo(_topBGImageView.width).multipliedBy(0.7);
    }];
    
    //  创建需要的毛玻璃特效类型
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    //  毛玻璃view 视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    //添加到要有毛玻璃特效的控件中
    //    effectView.alpha = 0.9;
    [_topBGImageView addSubview:effectView];
    
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(@0);
    }];
    
    _userImageView = ({
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
        imageView.image = [UIImage imageNamed:@"头像.jpg"];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [_topBGImageView addSubview:imageView];
        imageView;
    });
    [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_topBGImageView);
        make.size.equalTo(_topBGImageView.width).multipliedBy(0.22);
    }];
    _userImageView.layer.cornerRadius = NOW_SCR_W * 0.11;
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changUserInfoTapGesture:)];
    [_userImageView addGestureRecognizer:tapGesture];
    
    _userNameLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:17];
        [_topBGImageView addSubview:label];
        label;
    });
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_topBGImageView);
        make.top.equalTo(_userImageView.bottom).offset(@10);
        make.height.equalTo(@25);
    }];
    
    _addressLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:11];
        [_topBGImageView addSubview:label];
        label;
    });
    
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(_userNameLabel);
        make.right.equalTo(@-20);
        make.left.equalTo(_userNameLabel.right).offset(5);
    }];
    
    _mottoLabel = ({
        UILabel * label = [[UILabel alloc] init];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        [_topBGImageView addSubview:label];
        label;
    });
    
    [_mottoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.top.equalTo(_addressLabel.bottom).offset(@10);
        make.height.equalTo(25);
    }];
    
    NSArray * titleArray = [NSArray arrayWithObjects:@"我的帐号",@"系统设置",@"中心简介", nil];
    
    NSInteger button_H  = 60;
    
    for (int i = 0; i < titleArray.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor whiteColor];
        button.tag = FamilyBut_TAG + i;
        [button addTarget:self action:@selector(familyButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.top.equalTo(_topBGImageView.bottom).offset(button_H * i);
            make.height.equalTo(@(button_H));
        }];
        
        UILabel * titleLabel = [UILabel createLabelWithText:titleArray[i] font:16 subView:self.view];
        [button addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(@0);
            make.left.equalTo(@20);
            make.width.equalTo(@100);
        }];
        
        //右箭头
        UIImageView * rightImageView = [[UIImageView alloc] init];
        rightImageView.image = [UIImage imageNamed:@"右箭头"];
        [button addSubview:rightImageView];
        [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(10, 17));
            make.centerY.equalTo(button);
            make.right.equalTo(@-15);
        }];
        
        //分割线
        UIView * lineView = [[UIView alloc] init];
        lineView.backgroundColor = THEMECOLOR_LINE;
        [button addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.bottom.equalTo(@0);
            make.right.equalTo(@0);
            make.height.equalTo(@1);
        }];
        
    }
    
}


#pragma mark -- gesture
- (void)changUserInfoTapGesture:(UITapGestureRecognizer *)gesture
{

}


#pragma mark -- button pressed
- (void)familyButtonPressed:(UIButton *)sender
{
    NSInteger index = sender.tag - FamilyBut_TAG;
    
    switch (index) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
           
        }
            break;
        case 2:
        {
          
        }
            break;
            
        default:
            break;
    }
}

@end
