//
//  FlexibleFrame.m
//  layer狂魔33
//
//  Created by rimi on 15/6/11.
//  Copyright (c) 2015年 zhangyi. All rights reserved.
//

#import "FlexibleFrame.h"
#define IPHONE5_SCREEN CGSizeMake(320,568)

@implementation FlexibleFrame

- (CGFloat)ratio
{
//    //判断适配4s
//    if ([UIScreen mainScreen].bounds.size.height == 480) {
//        return [[UIScreen mainScreen] bounds].size.height/IPHONE5_SCREEN.height;
//    }
    return [[UIScreen mainScreen] bounds].size.width/IPHONE5_SCREEN.width;
}

+ (CGFloat)flexibleFloat:(CGFloat)aFloat
{
    FlexibleFrame * flexible = [[FlexibleFrame alloc] init];
    return aFloat * [flexible ratio];
}

+ (CGRect)frameFromIphone5Frame:(CGRect)iphone5Frame
{
    
    CGFloat x;
    CGFloat y;
    CGFloat width;
    CGFloat height;
//    BOOL isIphone4 = NO;
////    if (MAINSCRREN_H == 480) {
////        if (width == height) {
////            isIphone4 = YES;
////        }
////    }
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        y = [FlexibleFrame flexibleFloat:iphone5Frame.origin.y];
        height = [FlexibleFrame flexibleFloat:iphone5Frame.size.height];
        x = iphone5Frame.origin.x;
        width = iphone5Frame.size.width;
    }else{
        y = [FlexibleFrame flexibleFloat:iphone5Frame.origin.y];
        x = [FlexibleFrame flexibleFloat:iphone5Frame.origin.x];
        height = [FlexibleFrame flexibleFloat:iphone5Frame.size.height];
        width = [FlexibleFrame flexibleFloat:iphone5Frame.size.width];
    }
    
//    if (isIphone4) {
//        width = height;
//    }
    
    return CGRectMake(x, y, width, height);
}

+ (void)flexibleWithSuperView:(UIView *)superView
{
    for (UIView *subView in superView.subviews) {
        if (subView.subviews.count > 0) {
            [self flexibleWithSuperView:subView];
        }
        if (subView.tag == LINEVIEW_TAG) {
            subView.frame = CGRectMake(FLEXIBLE_NUM(subView.frame.origin.x),FLEXIBLE_NUM(subView.frame.origin.y),FLEXIBLE_NUM(subView.frame.size.width), 1);
            continue;
        }
        subView.frame = FLEFRAME(subView.frame);
//        if ([subView isKindOfClass:[UILabel class]]) {
//            UILabel *label = (UILabel *)subView;
//            label.font = [UIFont fontWithName:label.font.fontName size:[FlexibleFrame flexibleFloat:label.font.pointSize]];
//        }
//        if ([subView isKindOfClass:[UITextField class]]) {
//            UITextField *textField = (UITextField *)subView;
//            textField.font = [UIFont fontWithName:textField.font.fontName size:[FlexibleFrame flexibleFloat:textField.font.pointSize]];
//        }
    }
}

+ (void)flexibleFontSizeWithSuperView:(UIView *)superView
{
    for (UIView *subView in superView.subviews) {
        if (subView.subviews.count > 0) {
            [FlexibleFrame flexibleFontSizeWithSuperView:subView];
        }
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)subView;
            label.font = [UIFont fontWithName:label.font.fontName size:[FlexibleFrame flexibleFontSize:label.font.pointSize]];
        }
        if ([subView isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)subView;
            textField.font = [UIFont fontWithName:textField.font.fontName size:[FlexibleFrame flexibleFontSize:textField.font.pointSize]];
        }
        if ([subView isKindOfClass:[UITextView class]]) {
            UITextView *textField = (UITextView *)subView;
            textField.font = [UIFont fontWithName:textField.font.fontName size:[FlexibleFrame flexibleFontSize:textField.font.pointSize]];
        }

        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)subView;
            button.titleLabel.font = [UIFont fontWithName:button.titleLabel.font.fontName size:[FlexibleFrame flexibleFontSize:button.titleLabel.font.pointSize]];
        }
    }
}

+ (CGFloat)flexibleFontSize:(CGFloat)fontSize
{
    return [self decimalWithFloatValue:[self flexibleFloat:fontSize]];
}

//+ (void)flexibleFontSizeWithSuperView:(UIView *)superView
//{
//    for (UIView *subView in superView.subviews) {
//        if (subView.subviews.count > 0) {
//            [FlexibleFrame flexibleFontSizeWithSuperView:subView];
//        }
//        if ([subView isKindOfClass:[UILabel class]]) {
//            UILabel *label = (UILabel *)subView;
//            label.font = [UIFont fontWithName:label.font.fontName size:[FlexibleFrame flexibleFloat:label.font.pointSize]];
//        }
//        if ([subView isKindOfClass:[UITextField class]]) {
//            UITextField *textField = (UITextField *)subView;
//            textField.font = [UIFont fontWithName:textField.font.fontName size:[FlexibleFrame flexibleFloat:textField.font.pointSize]];
//        }
//        if ([subView isKindOfClass:[UITextView class]]) {
//            UITextView *textField = (UITextView *)subView;
//            textField.font = [UIFont fontWithName:textField.font.fontName size:[FlexibleFrame flexibleFloat:textField.font.pointSize]];
//        }
//        
//        if ([subView isKindOfClass:[UIButton class]]) {
//            UIButton *button = (UIButton *)subView;
//            button.titleLabel.font = [UIFont fontWithName:button.titleLabel.font.fontName size:[FlexibleFrame flexibleFloat:button.titleLabel.font.pointSize]];
//        }
//    }
//}

//格式话小数 四舍五入类型
+ (CGFloat)decimalWithFloatValue:(CGFloat)floatValue
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:@"0"];
    
    return  [[NSNumber numberWithFloat:floatValue] floatValue];
}



@end
