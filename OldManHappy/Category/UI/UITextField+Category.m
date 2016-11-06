//
//  UITextField+Category.m
//  KindnessFind
//
//  Created by zhangyi on 16/9/23.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

+ (UITextField *)createTextFieldWithPlaceHoler:(NSString *)placeHoler subView:(UIView *)subView
{
    UITextField * textField = [[UITextField alloc] init];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = placeHoler;
    [subView addSubview:textField];
    return textField;
}

@end
