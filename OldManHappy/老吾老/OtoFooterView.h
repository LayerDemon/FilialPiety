//
//  OtoFooterView.h
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtoFooterView : UIView

@property (strong, nonatomic) UITableView *tableView;
@property (assign, nonatomic) NSInteger section;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end
