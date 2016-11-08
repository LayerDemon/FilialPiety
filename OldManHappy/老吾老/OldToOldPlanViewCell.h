//
//  OldToOldPlanViewCell.h
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OldToOldPlanViewCell : UITableViewCell

@property (strong, nonatomic) NSDictionary *dataDic;
@property (strong, nonatomic) NSDictionary *userPlanInfoDic;
@property (assign, nonatomic) BOOL isNewTopic;

- (void)refreshWithDataDic:(NSDictionary *)dataDic;

@end
