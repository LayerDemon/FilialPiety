//
//  OfcLiveViewCell.m
//  OldManHappy
//
//  Created by 李祖建 on 16/11/7.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "OfcLiveViewCell.h"
//#import "HArticleDetailViewController.h"

@interface OfcLiveViewCell ()

@property (strong, nonatomic) IBOutlet UIView *subContentView;
@property (strong, nonatomic) IBOutlet UIButton *headBtn;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UIImageView *coverImgView;
@property (strong, nonatomic) IBOutlet UIButton *titleBtn;

@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) IBOutlet UIView *lineViewH;
@property (strong, nonatomic) IBOutlet UIView *lineViewV;
@property (strong, nonatomic) IBOutlet UIImageView *commentIcon;
@property (strong, nonatomic) IBOutlet UIButton *commentCountBtn;
@property (strong, nonatomic) IBOutlet UIImageView *praiseIcon;
@property (strong, nonatomic) IBOutlet UIButton *praiseCountBtn;

- (IBAction)commentBtnPressed:(UIButton *)sender;
- (IBAction)praiseBtnPressed:(UIButton *)sender;
- (IBAction)headBtnPressed:(UIButton *)sender;

@end

@implementation OfcLiveViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"OfcLiveViewCell" owner:self options:nil] lastObject];
        self.contentView.frame = FLEFRAME(self.contentView.frame);
        FLEXIBLE_FONT(self);
        
        self.contentView.autoresizesSubviews = NO;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.subContentView.autoresizesSubviews = NO;
        
        self.headBtn.layer.cornerRadius = self.headBtn.frame.size.height/2;
        self.headBtn.layer.masksToBounds = YES;
        
        [self.praiseIcon setOriginX:0];
        [self.praiseIcon setOriginY:self.praiseCountBtn.frame.size.height/2-self.praiseIcon.frame.size.height/2];
        [self.praiseCountBtn addSubview:self.praiseIcon];
        
        [self.commentIcon setOriginX:0];
        [self.commentIcon setOriginY:self.commentCountBtn.frame.size.height/2-self.commentIcon.frame.size.height/2];
        [self.commentCountBtn addSubview:self.commentIcon];
    }
    return self;
}

#pragma mark - 加载数据

- (void)refreshWithDataDic:(NSDictionary *)dataDic
{
    NSString *jsonStr = @"{\"author\":\"飞鱼\",\"images\":\"http://121.43.115.181:8088/file/resources/201608/26/4304d4b7b37f440ca2d934de636f5ff7.jpg\",\"isPraise\":0,\"title\":\"天鹅湖原来真的有天鹅\",\"articleUid\":6,\"articleId\":51,\"articleAvatar\":\"http://121.43.115.181:8088/file/resources/201608/26/69c83266cf0d4706993d4a788e3bd53f.jpg\",\"praiseCount\":2,\"commentCount\":2}";
    dataDic = [jsonStr objectFromJSONString];
    self.articleDic = dataDic;
    [self.headBtn sd_setImageWithURL:[NSURL URLWithString:dataDic[@"articleAvatar"]] forState:UIControlStateNormal placeholderImage:PLACEHOLDERIMAGE_USER completed:nil];
    self.nameLabel.text = [NSString stringWithFormat:@"%@",dataDic[@"author"]];
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date =  dataDic[@"createTime"] ? [format dateFromString:dataDic[@"createTime"]] : [NSDate dateWithTimeIntervalSince1970:0];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    self.timeLabel.text = [NSDate formattedTimeFromTimeInterval:timeInterval];
    
    
    NSString *imageUrlStr = dataDic[@"images"];
    NSRange imageUrlRange = [imageUrlStr rangeOfString:@"/http://"];
    if (imageUrlRange.location != NSNotFound) {
        imageUrlStr = [imageUrlStr substringFromIndex:imageUrlRange.location+1];
    }
    [self.coverImgView sd_setImageWithURL:[NSURL URLWithString:imageUrlStr] placeholderImage:PLACEHOLDERIMAGE_BOOK completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loadCoverIamgeFinish" object:self.coverImgView.image];
    }];
    self.coverImgView.hidden = !imageUrlStr;
    
    NSString *titleStr = dataDic[@"title"];
    CGFloat paddingH = FLEXIBLE_NUM(17);
    CGFloat paddingV = FLEXIBLE_NUM(9);
    CGSize titleSize = [NSString sizeWithString:titleStr Font:self.titleBtn.titleLabel.font maxWidth:self.titleBtn.frame.size.width-paddingH*2 NumberOfLines:2];
    self.titleBtn.contentEdgeInsets = UIEdgeInsetsMake(paddingV,paddingH,paddingV,self.titleBtn.frame.size.width-titleSize.width-paddingH);
    [self.titleBtn setHeight:titleSize.height+paddingV*2];
    self.titleBtn.titleLabel.numberOfLines = 2;
    [self.titleBtn setTitle:titleStr forState:UIControlStateNormal];
    self.lineViewH.hidden = ![NSString isBlankStringWithString:imageUrlStr];
    self.lineViewV.hidden = ![NSString isBlankStringWithString:imageUrlStr];
    
    UIColor *titleColor = imageUrlStr ? [UIColor whiteColor] : _333333;
    UIColor *titleBgColor = imageUrlStr ? [[UIColor blackColor] colorWithAlphaComponent:0.4] : [UIColor whiteColor];
    [self.titleBtn setTitleColor:titleColor forState:UIControlStateNormal];
    self.titleBtn.backgroundColor = titleBgColor;
    CGFloat titleOriginY = imageUrlStr ? CGRectGetMaxY(self.coverImgView.frame)-self.titleBtn.frame.size.height : self.coverImgView.frame.origin.y;
    [self.titleBtn setOriginY:titleOriginY];
    
    //评论数量
    [self formatCountBtn:self.commentCountBtn countStr:[NSString stringWithFormat:@"%@",dataDic[@"commentCount"]]];
    
    //点赞数量
    [self refreshParseCountViewWithDataDic:dataDic];
    
    [self.bottomView setOriginY:CGRectGetMaxY(self.titleBtn.frame)];
    [self.subContentView setHeight:CGRectGetMaxY(self.bottomView.frame)];
    [self setHeight:CGRectGetMaxY(self.subContentView.frame)+FLEXIBLE_NUM(8)];
    self.subContentView.layer.masksToBounds = NO;
    self.subContentView.layer.shadowOpacity = 0.45f;
    self.subContentView.layer.shadowRadius = 1.0f;
    self.subContentView.layer.shadowOffset = CGSizeMake(0,FLEXIBLE_NUM(0.5));
    self.subContentView.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor;
    self.subContentView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(1,1,self.subContentView.frame.size.width-2,self.subContentView.frame.size.height-1) cornerRadius:0].CGPath;
    //设置缓存
    self.subContentView.layer.shouldRasterize = YES;
    //设置抗锯齿边缘
    self.subContentView.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)formatCountBtn:(UIButton *)countBtn countStr:(NSString *)countStr
{
    CGFloat paddingL = self.praiseIcon.frame.size.width+FLEXIBLE_NUM(4);
    //    NSString *commentCountStr = [NSString stringWithFormat:@"%@",dataDic[@"commentCount"]];
    CGSize commentCountSize = [NSString sizeWithString:countStr Font:countBtn.titleLabel.font maxWidth:MAINSCRREN_W NumberOfLines:0];
    CGFloat commentCountW = commentCountSize.width+paddingL+FLEXIBLE_NUM(14);
    //    commentCountW = commentCountW > FLEXIBLE_NUM(80) ? commentCountW : FLEXIBLE_NUM(80);
    [countBtn setWidth:commentCountW];
    countBtn.contentEdgeInsets = UIEdgeInsetsMake(countBtn.frame.size.height/2,paddingL,countBtn.frame.size.height/2,commentCountW-paddingL-commentCountSize.width);
    [countBtn setTitle:countStr forState:UIControlStateNormal];
    //    countBtn.backgroundColor = [UIColor grayColor];
}

- (void)refreshParseCountViewWithDataDic:(NSDictionary *)dataDic
{
    BOOL isPraise = [dataDic[@"isPraise"] integerValue];
    self.praiseCountBtn.selected = isPraise;
    NSInteger lastCount = [dataDic[@"praiseCount"] integerValue];
    //点赞数量
    [self formatCountBtn:self.praiseCountBtn countStr:[NSString stringWithFormat:@"%@",@(lastCount)]];
    UIImage *likeIconImg = self.praiseCountBtn.selected ? [UIImage imageNamed:@"had_praise_icon_sel"] : [UIImage imageNamed:@"had_praise_icon_nor"];
    self.praiseIcon.image = likeIconImg;
    [self.praiseCountBtn setOriginX:MAINSCRREN_W-self.praiseCountBtn.frame.size.width];
    [self.commentCountBtn setOriginX:self.praiseCountBtn.frame.origin.x-self.commentCountBtn.frame.size.width];
}

- (IBAction)commentBtnPressed:(UIButton *)sender {
//    HArticleDetailViewController *articleDetailVC = [[HArticleDetailViewController alloc]init];
//    articleDetailVC.articleDetailDic = [NSMutableDictionary dictionaryWithDictionary:self.articleDic];
//    articleDetailVC.showComment = YES;
//    [self.viewController.navigationController pushViewController:articleDetailVC animated:YES];
}

- (IBAction)praiseBtnPressed:(UIButton *)sender {
    [self.delegate articleViewCell:self didSelectedPraiseBtn:sender];
}

- (IBAction)headBtnPressed:(UIButton *)sender {
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:self.articleDic];
    if (tempDic[@"articleUid"]) {
        [tempDic setObject:tempDic[@"articleUid"] forKey:@"uid"];
    }
    if (tempDic[@"articleAvatar"]) {
        [tempDic setObject:tempDic[@"articleAvatar"] forKey:@"avatar"];
    }
    if (tempDic[@"author"]) {
        [tempDic setObject:tempDic[@"author"] forKey:@"nickname"];
    }
    
//    PersonalViewController_V202 *friendDetailVC = [[PersonalViewController_V202 alloc]initWithCurrentUserDic:tempDic];
//    [self.viewController.navigationController pushViewController:friendDetailVC animated:YES];
}
@end

