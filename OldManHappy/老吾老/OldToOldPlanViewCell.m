//
//  OldToOldPlanViewCell.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OldToOldPlanViewCell.h"
#import "YLProgressBar.h"
//#import "BookDetailViewController.h"

@interface OldToOldPlanViewCell ()

@property (strong, nonatomic) YLProgressBar *progressView;

@property (strong, nonatomic) IBOutlet UIView *subContentView;
@property (strong, nonatomic) IBOutlet UIButton *bookImgBtn;
//@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
//@property (strong, nonatomic) IBOutlet UILabel *progressLabel;
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;
@property (strong, nonatomic) IBOutlet UILabel *hintLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNoteLabel;

- (IBAction)bookBtnPressed:(UIButton *)sender;


@end

@implementation OldToOldPlanViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"OldToOldPlanViewCell" owner:self options:nil] lastObject];
        self.contentView.frame = FLEFRAME(self.contentView.frame);
        FLEXIBLE_FONT(self);
        self.contentView.autoresizesSubviews = NO;
        self.viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        
        self.bookImgBtn.contentMode = UIViewContentModeScaleAspectFit;
        self.bookImgBtn.layer.masksToBounds = NO;
        self.bookImgBtn.layer.shadowOpacity = 0.25f;
        self.bookImgBtn.layer.shadowRadius = 2.0f;
        self.bookImgBtn.layer.shadowOffset = CGSizeMake(FLEXIBLE_NUM(1),FLEXIBLE_NUM(1));
        self.bookImgBtn.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:1].CGColor;
        self.bookImgBtn.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bookImgBtn.bounds cornerRadius:0].CGPath;
        //设置缓存
        self.bookImgBtn.layer.shouldRasterize = YES;
        //设置抗锯齿边缘
        self.bookImgBtn.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
        self.subContentView.contentMode = UIViewContentModeScaleAspectFit;
        self.subContentView.layer.masksToBounds = NO;
        self.subContentView.layer.shadowOpacity = 0.2;
        self.subContentView.layer.shadowRadius = 2.0f;
        self.subContentView.layer.shadowOffset = CGSizeMake(0,0.5);
        self.subContentView.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:1].CGColor;
        self.subContentView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.subContentView.bounds cornerRadius:0].CGPath;
        //设置缓存
        self.subContentView.layer.shouldRasterize = YES;
        //设置抗锯齿边缘
        self.subContentView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
        [self.contentView addSubview:self.progressView];
    }
    return self;
}

- (void)refreshWithDataDic:(NSDictionary *)dataDic
{
    self.dataDic = dataDic;
    
    [self.bookImgBtn sd_setImageWithURL:[NSURL URLWithString:dataDic[@"image"]] forState:UIControlStateNormal placeholderImage:PLACEHOLDERIMAGE_BOOK completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            dispatch_async(dispatch_queue_create("easemob.com", NULL), ^{
                CGFloat width = image.size.width > FLEXIBLE_NUM(90) ? image.size.width : FLEXIBLE_NUM(90);
                CGFloat height = image.size.height > FLEXIBLE_NUM(132) ? image.size.height : FLEXIBLE_NUM(132);
                CGFloat scale = width/FLEXIBLE_NUM(90) > height/FLEXIBLE_NUM(132) ? width/FLEXIBLE_NUM(90) : height/FLEXIBLE_NUM(132);
                UIImage *newImage = [image imageByScalingAndCroppingForSize:CGSizeMake(FLEXIBLE_NUM(90)*(NSInteger)scale,FLEXIBLE_NUM(132)*(NSInteger)scale)];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.bookImgBtn setImage:newImage forState:UIControlStateNormal];
                });
            });
        }
    }];
    
    NSMutableDictionary *userPlanDic = [NSMutableDictionary dictionaryWithDictionary:dataDic[@"bookPlanUserPojo"]];
    self.userPlanInfoDic = userPlanDic;
    //设置进度
    CGFloat totalPages = [userPlanDic[@"totalPages"] floatValue];
    if (totalPages <= 0) {
        totalPages = 1;
    }
    CGFloat currentPages = [userPlanDic[@"pages"] floatValue];
    //    dataDic[]
    CGFloat progress = currentPages/totalPages;
    BOOL canAnimation = !self.progressView.currentProgress;
    [self.progressView setProgress:progress animated:canAnimation];
    
    //    self.progressLabel.text = [NSString stringWithFormat:@"%.0lf%%",progress*100];
    NSString *timeStr = [NSDate formattedTimeFromSystemDateString:userPlanDic[@"progressTime"]];
    NSString *infoStr = [NSString stringWithFormat:@"%@人参加  %@",userPlanDic[@"notesCount"],timeStr];
    NSMutableAttributedString *attrInfoStr = [[NSMutableAttributedString alloc]initWithString:infoStr];
    NSRange timeRange = [infoStr rangeOfString:timeStr];
    [attrInfoStr addAttribute:NSForegroundColorAttributeName value:_999999 range:timeRange];
    [attrInfoStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:FLEXIBLE_NUM(12)] range:timeRange];
    self.infoLabel.attributedText = attrInfoStr;
    
    //设置底部内容
    NSString *dataTypeStr = [NSString isBlankStringWithString:dataDic[@"type"]] ? @"BLANK" : dataDic[@"type"];
    
    self.lastNoteLabel.hidden = [dataTypeStr isEqualToString:@"COBBER"];
    
    //设置最后一条笔记内容
    NSString *noteContentStr = [dataTypeStr isEqualToString:@"BLANK"] ? @"好像还没有开始啊，赶快召集乡亲父老广场集合如何？" : dataDic[@"content"];
    noteContentStr = [NSString isBlankStringWithString:noteContentStr] ? [NSString stringWithFormat:@"我终于读到%@页了,大家加油~",userPlanDic[@"pages"]] : noteContentStr;
    
    CGSize noteContentSize = [NSString sizeWithString:noteContentStr Font:self.lastNoteLabel.font maxWidth:self.lastNoteLabel.frame.size.width NumberOfLines:2];
    self.lastNoteLabel.text= noteContentStr;
    [self.lastNoteLabel setHeight:noteContentSize.height];
    
    //设置在读好友头像
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:dataDic[@"bookPlanUserPojos"]];
    for (NSInteger i = 0; i < 5; i++) {
        UIButton *headBtn = [self viewWithTag:100+i];
        if (tempArray.count > i) {
            NSDictionary *planUserDic = tempArray[i];
            [headBtn sd_setImageWithURL:[NSURL URLWithString:planUserDic[@"avatar"]] forState:UIControlStateNormal placeholderImage:PLACEHOLDERIMAGE_USER completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
            }];
            headBtn.userInteractionEnabled = YES;
            [self.hintLabel setOriginX:CGRectGetMaxX(headBtn.frame)+FLEXIBLE_NUM(8)];
        }else{
            [headBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            headBtn.userInteractionEnabled = NO;
        }
        headBtn.layer.cornerRadius = headBtn.frame.size.height/2;
        headBtn.layer.masksToBounds = YES;
        headBtn.hidden = ![dataTypeStr isEqualToString:@"COBBER"];
        
        self.hintLabel.hidden = !tempArray.count;
    }
    self.isNewTopic = tempArray.count;
}

#pragma mark - getter
- (YLProgressBar *)progressView
{
    if (!_progressView) {
        _progressView = [[YLProgressBar alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.bookImgBtn.frame)+FLEXIBLE_NUM(8), self.bookImgBtn.frame.origin.y,self.frame.size.width-CGRectGetMaxX(self.bookImgBtn.frame)-FLEXIBLE_NUM(16),FLEXIBLE_NUM(20))];
        _progressView.progressTintColor = _33B272;
        _progressView.trackTintColor = [_33B272 colorWithAlphaComponent:0.5];
        _progressView.stripesOrientation       = YLProgressBarStripesOrientationVertical;
        _progressView.indicatorTextDisplayMode = YLProgressBarIndicatorTextDisplayModeFixedCenter;
        _progressView.indicatorTextLabel.textAlignment = NSTextAlignmentCenter;
        _progressView.indicatorTextLabel.font  = [UIFont fontWithName:@"Arial-BoldMT" size:20];
        
        _progressView.progress = 0;
    }
    return _progressView;
}

- (IBAction)bookBtnPressed:(UIButton *)sender {
//    BookDetailViewController *bookDetailVC = [[BookDetailViewController alloc]init];
//    bookDetailVC.dataDic = self.dataDic;
//    
//    [self.viewController.navigationController pushViewController:bookDetailVC animated:YES];
}
@end

