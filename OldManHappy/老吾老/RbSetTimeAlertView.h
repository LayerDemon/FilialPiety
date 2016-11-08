//
//  RbSetTimeAlertView.h
//  BookClub
//
//  Created by 李祖建 on 16/9/13.
//  Copyright © 2016年 LittleBitch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RbSetTimeAlertView : UIView

- (IBAction)datePickerValueChanged:(UIDatePicker *)sender;

- (void)showSetTimeAlertViewAnimationWithCurrentDateString:(NSString *)currentDateString;

- (void)hiddenSetTimeAlertViewAnimation;

@end
