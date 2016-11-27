//
//  OldToOldHeaderView.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/11.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldToOldHeaderView.h"
#import "MorePlanViewController.h"
#import "OlderDetailInfoViewController.h"

@interface OldToOldHeaderView ()

@property (strong, nonatomic) IBOutlet UIImageView *headImgView;

@property (strong, nonatomic) IBOutlet UIButton *detailBtn;
@property (strong, nonatomic) IBOutlet UIButton *moreBtnPressed;
- (IBAction)moreBtnPressed:(UIButton *)sender;
- (IBAction)detailButtonPressed:(id)sender;

@end

@implementation OldToOldHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"OldToOldHeaderView" owner:self options:nil] lastObject];
        self.frame = FLEFRAME(self.frame);
        FLEXIBLE_FONT(self);
        
        for (UIView *subView in self.subviews) {
            subView.layer.cornerRadius = FLEXIBLE_NUM(6);
            subView.layer.masksToBounds = YES;
        }
        self.headImgView.layer.cornerRadius = self.headImgView.frame.size.height/2;
        self.headImgView.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7].CGColor;
        self.headImgView.layer.borderWidth = FLEXIBLE_NUM(3);
        self.headImgView.layer.masksToBounds = YES;
        
        self.detailBtn.layer.cornerRadius = self.detailBtn.frame.size.height/2;
        [self.detailBtn setDasheLineBorderWithBorderColor:[UIColor whiteColor] borderWidth:1];
    }
    return self;
}



- (IBAction)moreBtnPressed:(UIButton *)sender {
    MorePlanViewController *morePlanVC = [[MorePlanViewController alloc]init];
    [self.viewController.navigationController pushViewController:morePlanVC animated:YES];
}

- (IBAction)detailButtonPressed:(id)sender {
    
    OlderDetailInfoViewController   * detailInfo = [[OlderDetailInfoViewController alloc] init];
    [self.viewController.navigationController pushViewController:detailInfo animated:YES];
}
@end
