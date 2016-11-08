//
//  UIView+Special.h
//  BookClub
//
//  Created by 李祖建 on 16/11/2.
//  Copyright © 2016年 LittleBitch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Special)

/**
 设置黑色阴影
 */
- (void)setBlackShadowWithShadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset;

/**
 设置实线边框
 */
- (void)setFullLineBorderWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

/**
 设置虚线边框
 */
- (void)setDasheLineBorderWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end
