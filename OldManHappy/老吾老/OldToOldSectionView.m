//
//  OldToOldSectionView.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldToOldSectionView.h"
//#import "RbJoinPlanViewController.h"
#import "RbSetTimeAlertView.h"


#define TITLE_SetTime @"设置提醒"

@interface OldToOldSectionView ()

@property (strong, nonatomic) RbSetTimeAlertView *setTimeAlertView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *clockIconView;
@property (strong, nonatomic) IBOutlet UIButton *timeBtn;
@property (strong, nonatomic) IBOutlet UIButton *addPlanBtn;
- (IBAction)timeBtnPressed:(UIButton *)sender;
- (IBAction)addPlanBtnPressed:(UIButton *)sender;


@end

@implementation OldToOldSectionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"ReadBookSectionView" owner:self options:nil] lastObject];
        self.frame = FLEFRAME(self.frame);
        FLEXIBLE_FONT(self);
        self.autoresizesSubviews = NO;
        [self.clockIconView setOriginX:0];
        self.clockIconView.center = CGPointMake(self.clockIconView.center.x,self.timeBtn.frame.size.height/2);
        [self.timeBtn addSubview:self.clockIconView];
    }
    return self;
}

#pragma mark - 加载数据
- (void)refreshWithDataDic:(NSDictionary *)dataDic
{
    self.titleLabel.text = dataDic[@"title"];
    NSArray *bookListArray = dataDic[@"domains"];
    if (bookListArray.count) {
        [self setHeight:FLEXIBLE_NUM(40)];
    }else{
        [self setHeight:0];
    }
    NSDictionary *remindDic = dataDic[@"bookPlanRemindPojo"];
    self.remindDic = remindDic;
    
    self.timeBtn.hidden = !remindDic;
    self.addPlanBtn.hidden = !remindDic;
    NSString *titleStr = [remindDic[@"status"] integerValue] ? remindDic[@"remindStr"] : TITLE_SetTime;
    CGSize timeSize = [NSString sizeWithString:titleStr Font:self.timeBtn.titleLabel.font maxWidth:self.timeBtn.frame.size.width-self.clockIconView.frame.size.width-FLEXIBLE_NUM(4) NumberOfLines:0];
    self.timeBtn.contentEdgeInsets = UIEdgeInsetsMake(self.timeBtn.frame.size.height/2,self.clockIconView.frame.size.width+FLEXIBLE_NUM(4),self.timeBtn.frame.size.height/2, self.timeBtn.frame.size.width-self.clockIconView.frame.size.width-FLEXIBLE_NUM(4)-timeSize.width);
    [self.timeBtn setTitle:titleStr forState:UIControlStateNormal];
    
    
    //    if ([remindDic[@"status"] integerValue]) {
    //        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    //        [dateFormat setDateFormat:@"HH:mm"];
    //        NSDate *localDate = [dateFormat dateFromString:remindDic[@"remindStr"]];
    //        [LocalPushCenter localPushForDate:localDate alertBody:@"时间到了！快滚去读书了~"];
    //    }else{
    //        NSString *key = [NSString stringWithFormat:@"%@_localKey",[NSNumber versionNumber]];
    //        [LocalPushCenter cancleLocalPushWithKey:key];
    //    }
}

#pragma mark - getter
- (RbSetTimeAlertView *)setTimeAlertView
{
    if (!_setTimeAlertView) {
        _setTimeAlertView = [[RbSetTimeAlertView alloc]init];
    }
    return _setTimeAlertView;
}

#pragma mark - 按钮方法
- (IBAction)timeBtnPressed:(UIButton *)sender {
    [self.setTimeAlertView showSetTimeAlertViewAnimationWithCurrentDateString:self.remindDic[@"remindStr"]];
}

- (IBAction)addPlanBtnPressed:(UIButton *)sender {
//    RbJoinPlanViewController *joinPlanVC = [[RbJoinPlanViewController alloc]init];
//    joinPlanVC.isFirst = YES;
//    [self.viewController.navigationController pushViewController:joinPlanVC animated:YES];
}
@end
