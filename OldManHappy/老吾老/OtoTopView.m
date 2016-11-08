//
//  OtoTopView.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OtoTopView.h"
//#import "WIBookViewController.h"
//#import "RbFeaturedViewController.h"

@interface OtoTopView ()


- (IBAction)choiceBookBtnPressed:(UIButton *)sender;
- (IBAction)readMethodBtnPressed:(UIButton *)sender;
- (IBAction)readThinkBtnPressed:(UIButton *)sender;
- (IBAction)readEndBtnPressed:(UIButton *)sender;

@end

@implementation OtoTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"OtoTopView" owner:self options:nil] lastObject];
        self.frame = FLEFRAME(self.frame);
        FLEXIBLE_FONT(self);
    }
    return self;
}

#pragma mark - 按钮方法

- (IBAction)choiceBookBtnPressed:(UIButton *)sender {
//    RbFeaturedViewController *featuredVC = [[RbFeaturedViewController alloc]init];
//    featuredVC.firstIndex = 1;
//    [self.viewController.navigationController pushViewController:featuredVC animated:YES];
}

- (IBAction)readMethodBtnPressed:(UIButton *)sender {
//    RbFeaturedViewController *featuredVC = [[RbFeaturedViewController alloc]init];
//    featuredVC.firstIndex = 2;
//    [self.viewController.navigationController pushViewController:featuredVC animated:YES];
}

- (IBAction)readThinkBtnPressed:(UIButton *)sender {
//    WIBookViewController *wantBookVC = [[WIBookViewController alloc]init];
//    wantBookVC.userDic = [NSDictionary userDic];
//    wantBookVC.type = @"TOTHINK";
//    wantBookVC.titleStr = @"想读的书";
//    
//    [self.viewController.navigationController pushViewController:wantBookVC animated:YES];
}

- (IBAction)readEndBtnPressed:(UIButton *)sender {
//    WIBookViewController *wantBookVC = [[WIBookViewController alloc]init];
//    wantBookVC.userDic = [NSDictionary userDic];
//    wantBookVC.type = @"TOREAD";
//    wantBookVC.titleStr = @"读过的书";
//    
//    [self.viewController.navigationController pushViewController:wantBookVC animated:YES];
}
@end
