//
//  OldFriendDetailViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/10.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldFriendDetailViewController.h"

@interface OldFriendDetailViewController ()


@property (strong, nonatomic) NSString          * titleString;

@end

@implementation OldFriendDetailViewController

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _titleString = title;
        self.navigationItem.title = title;
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
        make.height.equalTo(@(NOW_SCR_H - 64 - 49));
    }];
}

@end
