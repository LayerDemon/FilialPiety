//
//  MorePlanHeaderView.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/11.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "MorePlanHeaderView.h"

@implementation MorePlanHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"MorePlanHeaderView" owner:self options:nil] lastObject];
        self.frame = FLEFRAME(self.frame);
        FLEXIBLE_FONT(self);
    }
    return self;
}

@end
