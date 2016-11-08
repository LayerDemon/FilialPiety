//
//  LBBaseHeader.h
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#ifndef LBBaseHeader_h
#define LBBaseHeader_h

//扩展
#import "UIView+Special.h"
#import "UIView+LBCategory.h"
#import "UIViewController+Category.h"
#import "UIButton+LBCategory.h"
#import "NSString+LBCategory.h"
#import "UIImageView+WebCache.h"//图片缓存
#import "UIButton+WebCache.h"
#import "NSDate+Category.h"//时间格式化
#import "UINavigationController+FDFullscreenPopGesture.h"


//第三方
#import "MJRefresh.h"
#import "JSONKit.h"

//单例
#define WINDOW ((AppDelegate *)[UIApplication sharedApplication].delegate).window//window

//系统版本
#define SYSTEMVERSION [UIDevice currentDevice].systemVersion.floatValue


//屏幕适配
#import "FlexibleFrame.h"
#define SXNOTFOUND 2000
#define TABBAR_H 49
#define NAVBAR_H 64

#define MAINSCRREN_B [UIScreen mainScreen].bounds
#define MAINSCRREN_W [UIScreen mainScreen].bounds.size.width
#define MAINSCRREN_H [UIScreen mainScreen].bounds.size.height

#define FLEXIBLE_FRAME(x,y,w,h) [FlexibleFrame frameFromIphone5Frame:CGRectMake(x, y, w, h)]
#define FLEFRAME(frame) [FlexibleFrame frameFromIphone5Frame:frame]

#define FLEXIBLE_NUM(num) [FlexibleFrame flexibleFloat:num]
#define FLEXIBLE_SIZE(w,h) CGSizeMake(FLEXIBLE_NUM(w),FLEXIBLE_NUM(h))
#define FLEXIBLE_CENTER(w,h) CGPointMake(FLEXIBLE_NUM(w),FLEXIBLE_NUM(h))
#define FLE_SCREEN_SIZE FLEXIBLE_FRAME(0,0,320,568)
#define FLEXIBLE_FONT(superView) [FlexibleFrame flexibleFontSizeWithSuperView:(superView)]
#define FLEXIBLE_SUBVIEW(superView) [FlexibleFrame flexibleWithSuperView:(superView)]


//主题色
#define ARGB_COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0]  //颜色
//#define ITEM_SELECT_COLOR ARGB_COLOR(227,217,178, 1)
//#define ITEM_NORMAL_COLOR ARGB_COLOR(135, 135, 135, 1)
#define BG_COLOR ARGB_COLOR(229, 229, 229, 1)
//#define NAVTITLE_TINTCOLOR ARGB_COLOR(82, 82, 82, 1)
#define ITEM_SELECT_COLOR ARGB_COLOR(66, 186, 127, 1)
#define ITEM_NORMAL_COLOR ARGB_COLOR(149, 149, 149, 1)
#define NAVTITLE_TINTCOLOR ARGB_COLOR(255, 255, 255, 1)
//#define NAVBAR_TINTCOLOR ARGB_COLOR(255, 255, 255, 1)
//主题
#define SDProgressViewBackgroundColor ARGB_COLOR(240, 240, 240, 0.9)
#define _E3D9B2 ARGB_COLOR(227, 217, 178, 1)
#define _EEEEEE ARGB_COLOR(238, 238, 238, 1)
#define _525252 ARGB_COLOR(82, 82, 82, 1)
#define _D4D4D4 ARGB_COLOR(212, 212, 212, 1)
#define _999999 ARGB_COLOR(153, 153, 153, 1)
#define _808080 ARGB_COLOR(128, 128, 128, 1)
#define _D3D3D3 ARGB_COLOR(211, 211, 211, 1)
#define _B6B6B6 ARGB_COLOR(182, 182, 182, 1)
#define _333333 ARGB_COLOR(51, 51, 51, 1)
#define _76A4B3 ARGB_COLOR(118, 164, 179, 1)
#define _EB7527 ARGB_COLOR(235, 117, 39, 1)
#define _393A3E ARGB_COLOR(57, 58, 62, 0.9)
#define _FF7373 ARGB_COLOR(255, 115, 115, 1)
#define _D8D8D8 ARGB_COLOR(216, 216, 216, 1)
#define _DDDDDD ARGB_COLOR(221, 221, 221, 1)
#define _33B982 ARGB_COLOR(51, 185, 130, 1)
#define _33B272 ARGB_COLOR(51, 178, 114, 1)
#define _F7F7F7 ARGB_COLOR(247, 247, 247, 1)
#define _006F43 ARGB_COLOR(2, 111, 67, 1)

#define COLORS_LEANING @[ARGB_COLOR(117, 188, 105, 1),ARGB_COLOR(165, 208, 222, 1),ARGB_COLOR(255, 115, 115, 1),ARGB_COLOR(223, 186, 86, 1),ARGB_COLOR(51, 190, 186, 1),ARGB_COLOR(109, 163, 208, 1),ARGB_COLOR(254, 129, 72, 1)]

//默认头像
#define PLACEHOLDERIMAGE [UIImage imageNamed:@"icon5"]
#define PLACEHOLDERIMAGE_USER [UIImage imageNamed:@"bfsystemhead"]
#define PLACEHOLDERIMAGE_GROUP [UIImage imageNamed:@"fgsystemhead"]
#define PLACEHOLDERIMAGE_BOOK [UIImage imageNamed:@"h_bg_placeholder"]

#define MAXBOOKPAGE 99999

//VIEW-TAG
#define BOTTOMITEM_TAG 1000
#define INDICATORVIEW_TAG 2000

#define MAINBOTTOMVIEW_TAG 3000
#define MAINHOVERINGVIEW_TAG 4000

#define HINTLABEL_TAG 5000

#define PREVIEW_TAG 6000

#define HIGHLIGHTVIEW_TAG 1100
#define CUSTOMMENUVIEW_TAG 1200//下拉菜单

//#define BUTTON_TAG 100
#define IMGVIEW_TAG 200
#define TEXTFIELD_TAG 300
#define LABEL_TAG 400
#define LINEVIEW_TAG 500
#define SECTIONVIEW_TAG 600

#define MJHEADER_TAG 700
#define MJFOOTER_TAG 800

#define SCROLLVIEW_TAG 900

//通用字段
#define TITLE_ALERT @"书乡提示"
#define ACTIONSTYLE_CANCEL @"-CANCLE"
#define ACTIONSTYLE_NORMAL @"-NORMAL"
#define ACTIONSTYLE_DESTRUCTIVE @"-DESTRUCTIVE"
#define ACTIONSTYLE_DISABLED @"+DISABELD"

#endif /* LBBaseHeader_h */
