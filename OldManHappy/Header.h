//
//  Header.h
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define MAS_SHORTHAND
// 只要添加了这个宏，equalTo就等价于mas_equalTo
#define MAS_SHORTHAND_GLOBALS
// 这个头文件一定要放在上面两个宏的后面

#import "AppDelegate.h"
#import "BaseViewController.h"

//tool
#import "Masonry.h"                     //自动布局


//category
#import "AppDelegate+Category.h"
#import "UIImage+Category.h"
#import "UIButton+Category.h"
#import "UILabel+Category.h"
#import "UITextField+Category.h"
#import "UIView+Category.h"

#import "NSString+Category.h"
#import "NSArray+Category.h"

#define _COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0]  //颜色
#define _window ((AppDelegate *)[UIApplication sharedApplication].delegate).window

//主题色
#define THEMECOLOR_BACKGROUND _COLOR(230, 230, 230, 1)   //背景色
#define THEMECOLOR_BUTTON     _COLOR(38, 140, 218, 1)    //按钮色
#define THEMECOLOR_TINT       _COLOR(31, 139, 214, 1)
#define THEMECOLOR_LIGHTBACK  _COLOR(244,244,244,1);
#define THEMECOLOR_BG           _COLOR(245, 245, 245, 1)    //背景色
#define THEMECOLOR_BUT          _COLOR(255, 215, 57, 1)            //button偏黑色
#define THEMECOLOR_LINE         _COLOR(239,240,240,1)             //分割线

#define NOW_SCR_H [UIScreen mainScreen].bounds.size.height
#define NOW_SCR_W [UIScreen mainScreen].bounds.size.width

#endif /* Header_h */
