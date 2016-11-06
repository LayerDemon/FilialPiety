//
//  UILabel+Category.m
//  KindnessFind
//
//  Created by zhangyi on 16/9/23.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)


//快速创建label
+ (UILabel *)createLabelWithText:(NSString *)text font:(NSInteger)font subView:(UIView *)subView
{
    UILabel * label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    label.text = text;
    [subView addSubview:label];
    return label;
}

@end
