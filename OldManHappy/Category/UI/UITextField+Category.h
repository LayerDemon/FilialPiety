//
//  UITextField+Category.h
//  KindnessFind
//
//  Created by zhangyi on 16/9/23.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)

+ (UITextField *)createTextFieldWithPlaceHoler:(NSString *)placeHoler subView:(UIView *)subView;

@end
