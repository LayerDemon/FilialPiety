//
//  NSString+LBCategory.h
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LBCategory)

+ (BOOL)isBlankStringWithString:(NSString *)string;

+ (CGSize)sizeWithString:(NSString *)string Font:(UIFont *)font maxWidth:(CGFloat)maxWidth NumberOfLines:(NSInteger)numberOfLines;

@end
