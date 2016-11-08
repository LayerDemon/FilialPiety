//
//  LoginViewController.m
//  KindnessFind
//
//  Created by zhangyi on 16/9/22.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "LoginViewController.h"

#define TITLE_COLOR _COLOR(195, 162, 14, 1)

@interface LoginViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UITextField               * phoneTextField;
@property (strong, nonatomic) UITextField               * pswTextField;

@property (strong, nonatomic) UIButton                  * loginButton;

@end

@implementation LoginViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"登录";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self initializeUserInterface];
}



- (void)initializeUserInterface
{
    self.view.backgroundColor = [UIColor whiteColor];
//    [self setEdgesForExtendedLayout:UIRectEdgeBottom];
    
    //左上角返回
    UIBarButtonItem * leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonPressed:)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    //logo
    UIImageView * logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
    [self.view addSubview:logoImageView];
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.equalTo(@100);
        make.top.equalTo(@50);
    }];
    
    NSArray * titleArray = [NSArray arrayWithObjects:@"手机号码",@"密码", nil];
    for (int i = 0; i < 2; i ++) {
        UITextField * textField = [UITextField createTextFieldWithPlaceHoler:[NSString stringWithFormat:@"请输入%@",titleArray[i]] subView:self.view];
        textField.textColor = [UIColor darkGrayColor];
        textField.borderStyle = UITextBorderStyleNone;
        textField.delegate = self;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        if (i == 0) {
            textField.keyboardType = UIKeyboardTypeNumberPad;
            NSString * oldPhoneNum = [[NSUserDefaults standardUserDefaults] objectForKey:@"oldPhoneNum"];
            if (oldPhoneNum) {
                textField.text = oldPhoneNum;
            }
            _phoneTextField = textField;
        }else{
            textField.secureTextEntry = YES;
            _pswTextField = textField;
        }
    
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.height.equalTo(@40);
//            make.right.equalTo(@-40);
            make.width.equalTo(@(NOW_SCR_W - 80));
            make.top.equalTo(logoImageView.bottom).offset(@(30 + 50 * i));
        }];
        
        UIView * lineView = [[UIView alloc] init];
        lineView.backgroundColor = THEMECOLOR_LINE;
        [textField addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.bottom.equalTo(@-1);
            make.height.equalTo(@1);
        }];
    }
    
    //登录
    UIButton * loginButton = [UIButton createBottomButtonWithTitle:@"登录" subView:self.view];
    [loginButton setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    loginButton.userInteractionEnabled = NO;
    _loginButton = loginButton;
    
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pswTextField.bottom).offset(@40);
    }];
    
    //注册
    UIButton * registerBut = [UIButton createButtonWithTitle:@"立即注册" font:15 subView:self.view];
    [registerBut setTitleColor:THEMECOLOR_TINT forState:UIControlStateNormal];
    
    [registerBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.size.equalTo(CGSizeMake(80, 35));
        make.top.equalTo(loginButton.bottom).offset(@10);
    }];
    
    //找回密码
    UIButton * findBut = [UIButton createButtonWithTitle:@"忘记密码？" font:15 subView:self.view];
    [findBut setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [findBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(NOW_SCR_W - 30));
        make.size.equalTo(CGSizeMake(80, 35));
        make.top.equalTo(loginButton.bottom).offset(@10);
    }];
    
}

- (void)leftBarButtonPressed:(UIBarButtonItem *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
