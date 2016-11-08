//
//  UIButton+LBCategory.h
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LBCategory)

- (void)startAnimationWithIndicatorView:(UIActivityIndicatorView *)indicatorView;
- (void)stopAnimationWithIndicatorView:(UIActivityIndicatorView *)indicatorView title:(NSString *)title;
- (void)startAnimationWithIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle;
- (void)stopAnimationWithTitle:(NSString *)title;

- (BOOL)isStartIndicator;

+ (void)stopAllButtonAnimation;

@end
