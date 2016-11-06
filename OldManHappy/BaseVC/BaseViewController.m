
//
//  BaseViewController.m
//  KindnessFind
//
//  Created by zhangyi on 16/10/26.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () <UIScrollViewDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = THEMECOLOR_BG;
    
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.frame =  CGRectMake(0, 64, NOW_SCR_W, NOW_SCR_H - 64);
    scrollView.contentSize = CGSizeMake(NOW_SCR_W, NOW_SCR_H-63.75);
    self.view = scrollView;
}

//滑动回收键盘
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

@end
