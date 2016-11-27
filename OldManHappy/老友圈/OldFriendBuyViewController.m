//
//  OldFriendBuyViewController.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/25.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldFriendBuyViewController.h"

@interface OldFriendBuyViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *topImageView;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@property (strong, nonatomic) NSString          * titleString;

@end

@implementation OldFriendBuyViewController

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _titleString = title;
        self.navigationItem.title = title;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.topImageView.image = [UIImage imageNamed:_titleString];
}



@end
