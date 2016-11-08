//
//  OtoFooterView.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OtoFooterView.h"
//#import "RbHistoryPlanViewController.h"
//#import "RbpdPlanUserListViewController.h"
//#import "RbPlanDetailViewController.h"

@interface OtoFooterView ()



- (IBAction)moreHistoryBtnPressed:(UIButton *)sender;

@end

@implementation OtoFooterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"OtoFooterView" owner:self options:nil] lastObject];
        self.frame = FLEFRAME(self.frame);
        FLEXIBLE_FONT(self);
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    CGRect newFrame = frame;
    if (![self.titleLabel.text isEqualToString:@"更多历史"]) {
        CGRect sectionRect = [self.tableView rectForFooterInSection:self.section];
        newFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(sectionRect), CGRectGetWidth(frame), CGRectGetHeight(frame));
    }
    [super setFrame:newFrame];
}

- (IBAction)moreHistoryBtnPressed:(UIButton *)sender {
//    if ([self.titleLabel.text isEqualToString:@"更多历史"]) {
//        RbHistoryPlanViewController *userNoteVC = [[RbHistoryPlanViewController alloc]init];
//        userNoteVC.currentUserDic = [NSDictionary userDic];
//        [self.viewController.navigationController pushViewController:userNoteVC animated:YES];
//    }
//    if ([self.titleLabel.text isEqualToString:@"全部在读好友"] ||
//        [self.titleLabel.text isEqualToString:@"全部在读的人"]) {
//        RbpdPlanUserListViewController *planUserListVC = [[RbpdPlanUserListViewController alloc]init];
//        //        @"全部在读好友" : @"全部在读的人";
//        planUserListVC.planListTypeStr = [self.titleLabel.text isEqualToString:@"全部在读好友"] ? @"COBBER" : @"ALL";
//        planUserListVC.planDetailDic = ((RbPlanDetailViewController *)self.viewController).planDetailDic;
//        planUserListVC.userPlanStatus = ((RbPlanDetailViewController *)self.viewController).userPlanStatus;
//        [self.viewController.navigationController pushViewController:planUserListVC animated:YES];
//    }
}
@end

