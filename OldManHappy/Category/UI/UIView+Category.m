//
//  UIView+Category.m
//  KindnessFind
//
//  Created by zhangyi on 16/10/20.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

/** 获取当前View的控制器对象 */
-(UIViewController *)getCurrentVC
{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end
