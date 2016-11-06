//
//  OldToOldViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldToOldViewController.h"

@interface OldToOldViewController ()


@end

@implementation OldToOldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"老吾老";
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
