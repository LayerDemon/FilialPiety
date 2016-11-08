//
//  NewsScrollView.m
//  UI_Demo
//
//  Created by rimi on 15/5/7.
//  Copyright (c) 2015年 lihao. All rights reserved.
//

#import "NewsScrollView.h"


@interface NewsScrollView () <UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger     currentIndex;
@property (nonatomic, strong) UIScrollView  *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

- (void)initializeUserInterface;
- (void)startTimer;

@end

@implementation NewsScrollView

- (void)viewDidDisappear:(BOOL)animated
{
    [_displayLink setPaused:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_displayLink setPaused:NO];
}

- (instancetype)initWithFrame:(CGRect)frame
                   dataSource:(NSArray *)dataSource
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = dataSource;
        [self initializeUserInterface];
        _currentIndex = 1;
    }
    return self;
}

#pragma mark -- initialize
- (void)initializeUserInterface
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds) * (_dataSource.count + 2), CGRectGetHeight(self.bounds));
    _scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.bounds), 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 设置到边框处不弹起；
    _scrollView.bounces = NO;
    [self addSubview:_scrollView];
    
    // 设置界面
    for (int i = 0; i < _dataSource.count + 2; i ++) {
        NSInteger index = (i + _dataSource.count - 1) % _dataSource.count;
        // title图片
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.center = CGPointMake(CGRectGetMidX(self.bounds) + CGRectGetWidth(self.bounds) * i, CGRectGetMidY(self.bounds));
        imageView.tag = 1100 + index;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.userInteractionEnabled = YES;
        imageView.clipsToBounds = YES;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_dataSource[index]]];
  
        [_scrollView addSubview:imageView];
        
        UITapGestureRecognizer * tagGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [imageView addGestureRecognizer:tagGesture];
        

    }

    // 设置pageControl
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    _pageControl.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetHeight(self.bounds) - CGRectGetMidY(_pageControl.bounds) - 5);
    // 总页数
    _pageControl.numberOfPages = _dataSource.count;
    // 当前页数
    _pageControl.currentPage = 0;
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    [self addSubview:_pageControl];
    
    //类似NSTimer
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(startTimer)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:UITrackingRunLoopMode];
        [_displayLink setFrameInterval:240];  //设置时间间隔3秒
    }
}

#pragma mark -- <UIScrollViewDelegate>
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
     [_displayLink setPaused:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
     [_displayLink setPaused:NO];
    // 重新设置偏移量
    _currentIndex = round(scrollView.contentOffset.x / CGRectGetWidth(scrollView.bounds));
    _pageControl.currentPage = _currentIndex - 1;
    
    // 左滑判定
    if (_currentIndex == _dataSource.count + 1) {
        _currentIndex = 1;
        _pageControl.currentPage = 0;
        [_scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.bounds), 0)];
    }
    // 右划判定
    if (_currentIndex == 0) {
        _currentIndex = _dataSource.count;
        _pageControl.currentPage = _currentIndex - 1;
        [_scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.bounds) * _dataSource.count, 0)];
    }
    
}

- (void)startTimer
{
    // 重新设定scrollView偏移量
    _currentIndex = ++_currentIndex % (_dataSource.count + 2);
    [_scrollView setContentOffset:CGPointMake(CGRectGetWidth(_scrollView.bounds) * _currentIndex, 0) animated:YES];
    _pageControl.currentPage = _currentIndex - 1;
//    NSLog(@"currentIndex == %ld",_currentIndex);
    // 自动左滑判定
    if (_currentIndex == _dataSource.count + 1) {
        _currentIndex = 1;
        _pageControl.currentPage = 0;
        [self performSelector:@selector(goOn) withObject:nil afterDelay:0.5];
    }
}

- (void)goOn
{
     [_scrollView setContentOffset:CGPointMake(CGRectGetWidth(_scrollView.bounds), 0)];
}

#pragma  mark -- 手势
- (void)tapGesture:(UITapGestureRecognizer *)gesture
{
    [_delegate pushNeedNumber:gesture.view.tag - 1100];
}


@end
