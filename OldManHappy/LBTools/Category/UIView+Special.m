//
//  UIView+Special.m
//  BookClub
//
//  Created by 李祖建 on 16/11/2.
//  Copyright © 2016年 LittleBitch. All rights reserved.
//

#import "UIView+Special.h"

@implementation UIView (Special)

/**
 设置黑色阴影
 */
- (void)setBlackShadowWithShadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset
{
    self.layer.masksToBounds = NO;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:1].CGColor;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0].CGPath;
    //设置缓存
    self.layer.shouldRasterize = YES;
    //设置抗锯齿边缘
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}


/**
 设置实线边框
 */
- (void)setFullLineBorderWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth
{
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}

/**
 设置虚线边框
 */
- (void)setDasheLineBorderWithBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth
{
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = self.bounds;
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:self.layer.cornerRadius].CGPath;
    borderLayer.lineWidth = borderWidth;
    //虚线边框
    borderLayer.lineDashPattern = @[@3,@4];
    //实线边框
    //    borderLayer.lineDashPattern = nil;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = borderColor.CGColor;
    [self.layer addSublayer:borderLayer];
}

@end
