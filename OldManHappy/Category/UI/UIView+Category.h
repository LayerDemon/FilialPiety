//
//  UIView+Category.h
//  KindnessFind
//
//  Created by zhangyi on 16/10/20.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+Special.h"

@interface UIView (Category)

- (UIViewController *)getCurrentVC;

- (void)setWidth:(CGFloat)width;

- (void)setHeight:(CGFloat)height;

@end
