//
//  OfcLiveViewCell.h
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OfcLiveViewCell;

@protocol OfcLiveViewCellDelegate <NSObject>

- (void)articleViewCell:(OfcLiveViewCell *)cell didSelectedPraiseBtn:(UIButton *)sender;

@end

@interface OfcLiveViewCell : UITableViewCell

@property (assign, nonatomic) id<OfcLiveViewCellDelegate>delegate;

@property (strong, nonatomic) NSDictionary *articleDic;


- (void)refreshWithDataDic:(NSDictionary *)dataDic;
@end
