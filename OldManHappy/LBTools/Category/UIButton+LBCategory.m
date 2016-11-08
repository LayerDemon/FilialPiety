//
//  UIButton+LBCategory.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "UIButton+LBCategory.h"
#import "CustomIndicatorView.h"

@implementation UIButton (LBCategory)

- (void)startAnimationWithIndicatorView:(UIActivityIndicatorView *)indicatorView
{
    [self setTitle:@"" forState:UIControlStateNormal];
    [indicatorView startAnimating];
}

- (void)stopAnimationWithIndicatorView:(UIActivityIndicatorView *)indicatorView title:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
    [indicatorView stopAnimating];
}

- (void)startAnimationWithIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle
{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[CustomIndicatorView class]]) {
            [subView removeFromSuperview];
            break;
        }
    }
    CustomIndicatorView *indicatorView = [[CustomIndicatorView alloc]initWithActivityIndicatorStyle:indicatorStyle];
    indicatorView.tag = INDICATORVIEW_TAG;
    indicatorView.hidesWhenStopped = YES;
    self.userInteractionEnabled = NO;
    indicatorView.center = CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds));
    [self addSubview:indicatorView];
    [indicatorView startAnimating];
    indicatorView.tempTitle = self.titleLabel.text;
    [self setTitle:@"" forState:UIControlStateNormal];
}

- (void)stopAnimationWithTitle:(NSString *)title
{
    CustomIndicatorView *indicatorView = (CustomIndicatorView *)[self viewWithTag:INDICATORVIEW_TAG];
    if (indicatorView) {
        [indicatorView stopAnimating];
        if (title) {
            [self setTitle:title forState:UIControlStateNormal];
        }else{
            [self setTitle:indicatorView.tempTitle forState:UIControlStateNormal];
            if (self.selected) {
                [self setTitle:indicatorView.tempTitle forState:UIControlStateSelected];
            }
        }
        [indicatorView removeFromSuperview];
        self.userInteractionEnabled = YES;
        self.viewController.view.userInteractionEnabled = YES;
    }else{
        if (title) {
            [self setTitle:title forState:UIControlStateNormal];
            self.userInteractionEnabled = YES;
            self.viewController.view.userInteractionEnabled = YES;
        }
    }
    
}


- (BOOL)isStartIndicator
{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[CustomIndicatorView class]]) {
            return YES;
            break;
        }
    }
    return NO;
}



//停止所有的带菊花button
+ (void)stopAllButtonAnimation
{
    //停止菊花
    dispatch_async(dispatch_get_main_queue(), ^{
        CustomIndicatorView *indicatorView = (CustomIndicatorView *)[WINDOW viewWithTag:INDICATORVIEW_TAG];
        if (indicatorView) {
            UIButton *button = (UIButton *)indicatorView.superview;
            if (!button) {
                [indicatorView stopAnimating];
            }
            if ([NSString isBlankStringWithString:button.titleLabel.text]) {
                [button stopAnimationWithTitle:nil];
            }else{
                [button stopAnimationWithTitle:button.titleLabel.text];
            }
            
            button.viewController.view.userInteractionEnabled = YES;
            [self stopAllButtonAnimation];
        }else{
            return ;
        }
    });
}

@end
