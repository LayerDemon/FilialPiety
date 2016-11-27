//
//  OlderDetailInfoViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/26.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OlderDetailInfoViewController.h"

@interface OlderDetailInfoViewController ()

@end

@implementation OlderDetailInfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"详细资料";
        
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


@end
