//
//  OldFriendCicleViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldFriendCicleViewController.h"

@interface OldFriendCicleViewController ()



@end

@implementation OldFriendCicleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"老友圈";
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
}


@end
