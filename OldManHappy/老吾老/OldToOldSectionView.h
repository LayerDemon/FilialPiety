//
//  OldToOldSectionView.h
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OldToOldSectionView : UIView

@property (strong, nonatomic) NSDictionary *remindDic;

- (void)refreshWithDataDic:(NSDictionary *)dataDic;

@end
