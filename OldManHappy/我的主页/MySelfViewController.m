//
//  MySelfViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "MySelfViewController.h"

@interface MySelfViewController ()



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

#pragma mark -- initialize
- (void)initializeDataSource
{
    
}

- (void)initializeUserInterface
{
    self.view.backgroundColor = THEMECOLOR_BG;
}


@end
