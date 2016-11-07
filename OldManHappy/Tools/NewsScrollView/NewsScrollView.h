//
//  NewsScrollView.h
//  UI_Demo
//
//  Created by rimi on 15/5/7.
//  Copyright (c) 2015年 lihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewsScrollViewDelegate <NSObject>

- (void)pushNeedNumber:(NSInteger )number;

@end

@interface NewsScrollView : UIView

@property (nonatomic, copy) NSArray *dataSource;
@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, weak) id<NewsScrollViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                   dataSource:(NSArray *)dataSource;

@end
