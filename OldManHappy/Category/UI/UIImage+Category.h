//
//  UIImage+Category.h
//  KindnessFind
//
//  Created by zhangyi on 16/9/23.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

+ (UIImage *)createImageWithColor: (UIColor *) color;           //根据颜色生成图片

+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage defineWidth:(CGFloat)defineWidth;

+ (UIImage *)resizedImage:(NSString *)name;

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
