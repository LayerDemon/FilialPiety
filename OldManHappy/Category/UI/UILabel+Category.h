//
//  UILabel+Category.h
//  KindnessFind
//
//  Created by zhangyi on 16/9/23.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

//快速创建label
+ (UILabel *)createLabelWithText:(NSString *)text font:(NSInteger)font subView:(UIView *)subView;

@end
