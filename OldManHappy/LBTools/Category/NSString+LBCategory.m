//
//  NSString+LBCategory.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "NSString+LBCategory.h"

@implementation NSString (LBCategory)

+ (BOOL)isBlankStringWithString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

- (BOOL)isEqualToNumber:(id)number
{
    return [@([self floatValue]) isEqualToNumber:@([number floatValue])];
}

+ (CGSize)sizeWithString:(NSString *)string Font:(UIFont *)font maxWidth:(CGFloat)maxWidth NumberOfLines:(NSInteger)numberOfLines
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, maxWidth,0)];
    //    id tempObject = string;
    //    if (tempObject == [NSNull null] ) {
    //        string = @"";
    //    }
    string = [NSString stringWithFormat:@"%@",string];
    label.text = [NSString isBlankStringWithString:string] ? @"" : string;
    //    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.numberOfLines = numberOfLines;
    label.font = font;
    [label sizeToFit];
    return CGSizeMake(label.frame.size.width,label.frame.size.height);
}

@end
