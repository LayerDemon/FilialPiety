//
//  RbSetTimeAlertView.m
//  BookClub
//
//  Created by 李祖建 on 16/9/13.
//  Copyright © 2016年 LittleBitch. All rights reserved.
//

#import "RbSetTimeAlertView.h"
//#import "ReadBookModel.h"


@interface RbSetTimeAlertView ()


@property (strong, nonatomic) IBOutlet UIView *boxView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) IBOutlet UIButton *deleteBtn;
@property (strong, nonatomic) IBOutlet UIButton *setBtn;

//@property (strong, nonatomic) ReadBookModel *model;
@property (strong, nonatomic) NSString *currentDateString;
@property (strong, nonatomic) NSString *requestMethodEnum;

- (IBAction)deleteBtnPressed:(UIButton *)sender;
- (IBAction)setBtnPressed:(UIButton *)sender;

@end

@implementation RbSetTimeAlertView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [_model removeObserver:self forKeyPath:@"setRemindData"];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"RbSetTimeAlertView" owner:self options:nil] lastObject];
        self.frame = FLEFRAME(self.frame);
        FLEXIBLE_FONT(self);
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
        self.datePicker.locale = locale;
    }
    return self;
}

#pragma mark - ReadBookModel
//- (ReadBookModel *)model
//{
//    if (!_model) {
//        _model = [[ReadBookModel alloc]init];
//        [_model addObserver:self forKeyPath:@"setRemindData" options:NSKeyValueObservingOptionNew context:nil];
//    }
//    return _model;
//}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"setRemindData"]) {
//        [self setRemindDataParse];
//    }
//}

#pragma mark - 按钮方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hiddenSetTimeAlertViewAnimation];
}

- (IBAction)datePickerValueChanged:(UIDatePicker *)sender {
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"HH:mm"];
    NSString *dateString = [format stringFromDate:sender.date];
    self.currentDateString = dateString;
    
    NSString *titleString = [NSString stringWithFormat:@"提醒 [%@]",dateString];
    [self.setBtn setTitle:titleString forState:UIControlStateNormal];
}

- (IBAction)deleteBtnPressed:(UIButton *)sender {
    [sender startAnimationWithIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.requestMethodEnum = @"DELETE";
//    [self.model postSetRemindDataWithRemindStr:@"" status:0 requestMethodEnum:self.requestMethodEnum];
}

- (IBAction)setBtnPressed:(UIButton *)sender {
    [sender startAnimationWithIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.requestMethodEnum = @"POST";
//    [self.model postSetRemindDataWithRemindStr:self.currentDateString status:1 requestMethodEnum:self.requestMethodEnum];
}

#pragma mark - 自定义方法
- (void)showSetTimeAlertViewAnimationWithCurrentDateString:(NSString *)currentDateString
{
    [WINDOW addSubview:self];
    if ([NSString isBlankStringWithString:currentDateString]) {
        currentDateString = @"21:00";
    }
//    self.currentDateString = currentDateString;
    
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"HH:mm"];
    NSDate *currentDate = [format dateFromString:currentDateString];
    [self.datePicker setDate:currentDate];
    [self datePickerValueChanged:self.datePicker];
    
    self.alpha = 0;
    self.boxView.alpha = 0;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.boxView.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)hiddenSetTimeAlertViewAnimation
{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.boxView.alpha = 0;
    } completion:^(BOOL finished) {
       [UIView animateWithDuration:0.1 animations:^{
           self.alpha = 0;
       } completion:^(BOOL finished) {
           [self.deleteBtn stopAnimationWithTitle:nil];
           [self.setBtn stopAnimationWithTitle:nil];
           [self  removeFromSuperview];           
       }];
    }];
    
    
}

#pragma mark - 数据处理
- (void)setRemindDataParse
{
    if ([self.requestMethodEnum isEqualToString:@"POST"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateRemindTime" object:@{@"status":@(1),@"remindStr":self.currentDateString}];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateRemindTime" object:@{@"status":@(0)}];
    }
    [self hiddenSetTimeAlertViewAnimation];
}

@end
