//
//  UIButton+Category.h
//  KindnessFind
//
//  Created by zhangyi on 16/9/23.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

//创建底部button
+ (UIButton *)createBottomButtonWithTitle:(NSString *)title subView:(UIView *)subView;

//快速创建button
+ (UIButton *)createButtonWithTitle:(NSString *)title font:(NSInteger)font subView:(UIView *)subView;



@end
