//
//  UIButton+Category.m
//  KindnessFind
//
//  Created by zhangyi on 16/9/23.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

//创建底部button
+ (UIButton *)createBottomButtonWithTitle:(NSString *)title subView:(UIView *)subView
{
    UIButton * bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bottomButton setTitle:title forState:UIControlStateNormal];
    bottomButton.titleLabel.font = [UIFont systemFontOfSize:18];
    bottomButton.backgroundColor = THEMECOLOR_BUT;
    [subView addSubview:bottomButton];
    
    [bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.width.equalTo(@(NOW_SCR_W - 80));
        make.height.equalTo(@50);
    }];
    bottomButton.layer.cornerRadius = 2;
    return bottomButton;
}

//快速创建button
+ (UIButton *)createButtonWithTitle:(NSString *)title font:(NSInteger)font subView:(UIView *)subView
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [subView addSubview:button];
    return button;
}

@end
