//
//  HappyLifeListTableViewCell.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "HappyLifeListTableViewCell.h"

@implementation HappyLifeListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _userImageView = ({
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.clipsToBounds = YES;
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.contentView addSubview:imageView];
            imageView;
        });
        
        [_userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(@0);
            
            make.bottom.equalTo(@-1);
        }];
    }
    return self;
}

@end
