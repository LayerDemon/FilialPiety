//
//  UIViewController+Category.m
//  BookClub
//
//  Created by 李祖建 on 15/11/5.
//  Copyright © 2015年 LittleBitch. All rights reserved.
//

#import "UIViewController+Category.h"
//#import "LRViewController.h"
//#import "KxMenu.h"
//#import "ZBarViewController.h"
//#import "ScanCodeViewController.h"
//#import "RecordViewController.h"
//#import "BFriendAddViewController.h"
//#import "EditArticlesViewController.h"
//#import "BookPayViewController.h"

@implementation UIViewController (Category)




#pragma mark - 标题---------------------------------
- (void)setIndicatorTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:MAINSCRREN_B];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:button.titleLabel.font.pointSize];
    [titleLabel sizeToFit];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.frame = titleLabel.frame;
    [button setHeight:titleLabel.frame.size.height+FLEXIBLE_NUM(4)];
    [button setWidth:titleLabel.frame.size.width+FLEXIBLE_NUM(4)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:NAVTITLE_TINTCOLOR forState:UIControlStateNormal];
    
    self.navigationItem.titleView = button;
}


- (void)setMenuIndicatorTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:MAINSCRREN_B];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:button.titleLabel.font.pointSize];
    [titleLabel sizeToFit];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.frame = titleLabel.frame;
    [button setHeight:titleLabel.frame.size.height+FLEXIBLE_NUM(4)];
    [button setWidth:titleLabel.frame.size.width+FLEXIBLE_NUM(25)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(titleItemPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [iconBtn setBackgroundImage:[UIImage imageNamed:@"zbi_xiasanjiao_icon"] forState:UIControlStateNormal];
    iconBtn.frame = CGRectMake(button.frame.size.width-10,button.frame.size.height/2-2.5,10,5);
    [button addSubview:iconBtn];
    
    self.navigationItem.titleView = button;
}



- (void)startTitleIndicator
{
//    self.view.userInteractionEnabled = NO;
    if ([self.navigationItem.titleView isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)self.navigationItem.titleView;
        button.viewController.view.userInteractionEnabled = NO;
        [button startAnimationWithIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    }
}

- (void)stopTitleIndicator
{
    if ([self.navigationItem.titleView isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)self.navigationItem.titleView;
        
        button.viewController.view.userInteractionEnabled = YES;
        [button stopAnimationWithTitle:button.titleLabel.text];
    }
}


- (void)titleItemPressed:(UIButton *)sender
{
    
}





#pragma mark - 弹框----------------------------------------
- (void)showAlertControlWithMessage:(NSString *)message
{
    if (SYSTEMVERSION >= 8.0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"书乡提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
//    else{
//#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_9_0
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"书乡提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        [alertView show];
//#endif
//    }
}

//弹框
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles;
{

    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        for (NSInteger i = 0; i < buttonTitles.count; i++) {
            NSString *tempStr = buttonTitles[i];
            NSString *buttonTitleStr = [self formatButtonTitle:tempStr];
            UIAlertActionStyle actionStyle = [self actionStyleWithTitle:tempStr];
            
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:buttonTitleStr style:actionStyle handler:^(UIAlertAction * _Nonnull action) {
                [self clickedDataAlertButtonWithMessage:message buttonTitle:buttonTitleStr];
            }];
            [alertController addAction:alertAction];
        }
        [self presentViewController:alertController animated:YES completion:nil];
    }
//    else{
//#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_9_0
//        
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
//        
//        for (NSInteger i = 0 ; i < buttonTitles.count; i++) {
//            NSString *tempStr = buttonTitles[i];
//            NSString *buttonTitleStr = [self formatButtonTitle:tempStr];
//            [alertView addButtonWithTitle:buttonTitleStr];
//        }
//        alertView.delegate = self;
//        [alertView show];
//#endif
//    }
}

//sheet
- (void)showActionSheetViewWithTitle:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles;
{
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleActionSheet];
        
        for (NSInteger i = 0; i < buttonTitles.count; i++) {
            NSString *tempStr = buttonTitles[i];
            NSString *buttonTitleStr = [self formatButtonTitle:tempStr];
            UIAlertActionStyle actionStyle = [self actionStyleWithTitle:tempStr];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:buttonTitleStr style:actionStyle handler:^(UIAlertAction * _Nonnull action) {
                [self clickedDataAlertButtonWithMessage:message buttonTitle:buttonTitleStr];
            }];
            
            [self disabledButtonWithAlertAction:alertAction];
            
            [alertController addAction:alertAction];
        }
//        [self disabledButtonWithSuperView:alertController.view];
        [self presentViewController:alertController animated:YES completion:nil];
    }
//    else{
//#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_9_0
//        
//        
////        NSMutableArray *tempButtonTitles = [NSMutableArray arrayWithArray:buttonTitles];
////        for (NSString *tempStr in buttonTitles) {
////            NSString *buttonTitleStr = [self formatButtonTitle:tempStr];
////            
////            if (![buttonTitleStr isEqualToString:@"取消"]) {
////                [tempButtonTitles removeObject:tempStr];
////            }
////        }
//        
//        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:message delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
////        NSInteger cancelIndex = 0;
//        for (NSInteger i = 0 ; i < buttonTitles.count; i++) {
//            NSString *tempStr = buttonTitles[i];
//            NSString *buttonTitleStr = [self formatButtonTitle:tempStr];
//            if ([self actionStyleWithTitle:tempStr] == UIAlertActionStyleDestructive) {
//                actionSheet.destructiveButtonIndex = i;
//            }
//            if (![buttonTitleStr isEqualToString:@"取消"]) {
//                [actionSheet addButtonWithTitle:buttonTitleStr];
//            }
//        }
//        
//        [actionSheet addButtonWithTitle:@"取消"];
//        
//        actionSheet.cancelButtonIndex = actionSheet.numberOfButtons - 1;
//        
//        [self disabledButtonWithSuperView:actionSheet];
//        
//        [actionSheet showInView:WINDOW];
//#endif
//    }
}

//- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
//{
//    for (UIView *subViwe in actionSheet.subviews) {
//        
//        if ([subViwe isKindOfClass:[UIButton class]]) {
//            
//            UIButton *button = (UIButton*)subViwe;
//            
//            [button setTitleColor:_333333 forState:UIControlStateNormal];
//            
//        }
//    }
//}

- (void)disabledButtonWithAlertAction:(UIAlertAction *)alertAction
{
    NSString *buttonTitle = alertAction.title;
    NSRange range = [buttonTitle rangeOfString:@"+"];
    if (range.location != NSNotFound) {
        NSRange rangeCancel = [buttonTitle rangeOfString:ACTIONSTYLE_DISABLED];
        if (rangeCancel.location != NSNotFound) {
            //修改按钮
            if ([alertAction valueForKey:@"titleTextColor"]) {
                [alertAction setValue:_999999 forKey:@"titleTextColor"];
            }
        }
        if ([alertAction valueForKey:@"title"]) {
            [alertAction setValue:[buttonTitle substringToIndex:range.location] forKey:@"title"];
        }
        alertAction.enabled = NO;
    }
}

- (void)disabledButtonWithSuperView:(UIView *)superView{
    for (UIView *subView in superView.subviews) {
        if (subView.subviews.count > 0) {
            [self disabledButtonWithSuperView:subView];
        }
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*)subView;
            NSRange range = [button.titleLabel.text rangeOfString:@"+"];
            if (range.location != NSNotFound) {
                [button setTitle:[button.titleLabel.text substringToIndex:range.location] forState:UIControlStateNormal];
                [button setTitleColor:_999999 forState:UIControlStateNormal];
                button.userInteractionEnabled = NO;
            }
        }
    }
}

- (NSString *)formatButtonTitle:(NSString *)buttonTitle
{
    NSRange range = [buttonTitle rangeOfString:@"-"];
    if (range.location != NSNotFound) {
        return [buttonTitle substringToIndex:range.location];
    }
    return buttonTitle;
}

- (UIAlertActionStyle)actionStyleWithTitle:(NSString *)title
{
    NSRange rangeCancel = [title rangeOfString:ACTIONSTYLE_CANCEL];
    if (rangeCancel.location != NSNotFound) {
        return UIAlertActionStyleCancel;
    }
    NSRange rangeNormal = [title rangeOfString:ACTIONSTYLE_DESTRUCTIVE];
    if (rangeNormal.location != NSNotFound) {
        return UIAlertActionStyleDestructive;
    }
    
    return UIAlertActionStyleDefault;
}

//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    [self clickedDataAlertButtonWithMessage:actionSheet.title buttonTitle:[actionSheet buttonTitleAtIndex:buttonIndex]];
//}
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    [self clickedDataAlertButtonWithMessage:alertView.message buttonTitle:[alertView buttonTitleAtIndex:buttonIndex]];
//}

- (void)clickedDataAlertButtonWithMessage:(NSString *)message buttonTitle:(NSString *)buttonTitle
{
//    if ([message isEqualToString:@"登录信息失效，请重新登录~"]) {
//        [self logOut];
//    }
    [self clickedAlertButtonWithMessage:message buttonTitle:buttonTitle];
}

- (void)clickedAlertButtonWithMessage:(NSString *)message buttonTitle:(NSString *)buttonTitle
{
    
}

//- (void)logOut
//{
//    
//    if ([WINDOW.rootViewController isKindOfClass:[UINavigationController class]]) {
//        UINavigationController *navC = (UINavigationController *)WINDOW.rootViewController;
//        if ([[navC.viewControllers firstObject] isKindOfClass:[LRViewController class]]) {
//            return;
//        }
//    }
//    [[EaseMob sharedInstance].chatManager disableAutoLogin];//关闭自动登录
//
//    //退出环信
//    __weak UIViewController *weakSelf = self;
//    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:YES completion:^(NSDictionary *info, EMError *error) {
//        //清除缓存
//        for (NSString *key in DEFAULTS_KEYS) {
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
//        }
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        //删除数据库
//        [CACHE_MANAGER deleteDatabseWithDbname:DBNAME];
//        NSLog(@"退出成功");
//        LRViewController *lrVC = [[LRViewController alloc]init];
//        UINavigationController *lrNC = [[UINavigationController alloc]initWithRootViewController:lrVC];
//        [lrNC.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//        // 添加上这一句，可以去掉导航条下边的shadowImage，就可以正常显示了
//        lrNC.navigationBar.shadowImage = [[UIImage alloc] init];
//        lrNC.navigationController.navigationBar.tintColor = NAVTITLE_TINTCOLOR;
////#warning --- 修改登录页的导航栏模式~。
//        lrNC.navigationBar.barTintColor = ITEM_SELECT_COLOR;
//        lrNC.navigationBar.translucent = NO;
//        [lrNC.navigationBar setBackgroundImage:[[UIImage alloc]init]
//                                 forBarMetrics:UIBarMetricsDefault];
//        lrNC.navigationBar.shadowImage = [[UIImage alloc] init];
//        lrNC.navigationBar.tintColor = NAVTITLE_TINTCOLOR;
//        
//        [weakSelf presentViewController:lrNC animated:YES completion:^{
//            WINDOW.rootViewController = lrNC;
//        }];
//    } onQueue:nil];
//}


#pragma mark - 通用弹出添加菜单按钮方法
//- (void)mainAddItemPressed:(UIButton *)sender
//{
//    NSLog(@"showMenu");
//    NSArray *menuItems =
//    @[
//      
//      //      [KxMenuItem menuItem:@"ACTION MENU"
//      //                     image:nil
//      //                    target:nil
//      //                    action:NULL],
//      
//      [KxMenuItem menuItem:@"扫一扫"
//                     image:[UIImage imageNamed:@"nav_menuscan_icon"]
//                    target:self
//                    action:@selector(pushMenuItem:)],
//      
//      [KxMenuItem menuItem:@"记笔记"
//                     image:[UIImage imageNamed:@"nav_menunote_icon"]
//                    target:self
//                    action:@selector(pushMenuItem:)],
//      
//      [KxMenuItem menuItem:@"写文章"
//                     image:[UIImage imageNamed:@"nav_menuarticle_icon"]
//                    target:self
//                    action:@selector(pushMenuItem:)],
//      
//      [KxMenuItem menuItem:@"加好友/群"
//                     image:[UIImage imageNamed:@"nav_menuadd_icon"]
//                    target:self
//                    action:@selector(pushMenuItem:)],
//      
//      [KxMenuItem menuItem:@"测试支付"
//                     image:[UIImage imageNamed:@"nav_menuadd_icon"]
//                    target:self
//                    action:@selector(pushMenuItem:)],
//      
//      ];
//    
//    for (KxMenuItem *item in menuItems) {
//        item.foreColor = [UIColor grayColor];
//    }
//    //    KxMenuItem *first = menuItems[0];
//    //    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
//    //    first.alignment = NSTextAlignmentCenter;
//    CGRect fromRect = sender.frame;
//    fromRect.origin.y = NAVBAR_H-sender.frame.size.height;
//    [KxMenu setTintColor:[UIColor whiteColor]];
//    [KxMenu setTitleFont:[UIFont systemFontOfSize:FLEXIBLE_NUM(12)]];
//    [KxMenu showMenuInView:self.view
//                  fromRect:fromRect
//                 menuItems:menuItems];
//}
//
//- (void)pushMenuItem:(id)sender
//{
//    KxMenuItem *item = sender;
//    if ([item.title isEqualToString:@"扫一扫"]) {
//        [self pushZBarVC];
//    }
//    if ([item.title isEqualToString:@"记笔记"]) {
//        [self pushRecordVC];
//    }
//    if ([item.title isEqualToString:@"加好友/群"]) {
//        [self pushAddFriendViewController];
//    }
//    if ([item.title isEqualToString:@"写文章"]) {
//        [self pushEditArticleViewController];
//    }
//    if ([item.title isEqualToString:@"测试支付"]) {
//        [self pushBookPayViewController];
//    }
//}
//
//- (void)pushZBarVC
//{
//    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
//    if (status == AVAuthorizationStatusRestricted || status ==AVAuthorizationStatusDenied)
//    {
//        [AppDelegate showHintLabelWithMessage:@"相机访问受限，无法扫码~"];
//    }
//    
//    ScanCodeViewController *ZBarVC = [[ScanCodeViewController alloc]init];
//    [self.navigationController pushViewController:ZBarVC animated:YES];
////    UINavigationController *ZBarNC = [[UINavigationController alloc]initWithRootViewController:ZBarVC];
////    ZBarNC.navigationBar.barTintColor = ITEM_SELECT_COLOR;
////    ZBarNC.navigationBar.translucent = NO;
////    [ZBarNC.navigationBar setBackgroundImage:[[UIImage alloc]init]
////                               forBarMetrics:UIBarMetricsDefault];
////    ZBarNC.navigationBar.shadowImage = [[UIImage alloc] init];
////    ZBarNC.navigationBar.tintColor = NAVTITLE_TINTCOLOR;
////    [self presentViewController:ZBarNC animated:YES completion:nil];
//}
//
////- (UINavigationItem *)navigationItem
////{
////    UINavigationItem *backItm = [[UINavigationItem alloc]initWithTitle:@""];
////    return backItm;
////}
//
//- (void)pushRecordVC
//{
//    NSLog(@"记录");
//    RecordViewController *recordVC = [[RecordViewController alloc]init];
//    [self.navigationController pushViewController:recordVC animated:YES];
////    UINavigationController *recordNC = [[UINavigationController alloc]initWithRootViewController:recordVC];
////    recordNC.navigationBar.barTintColor = ITEM_SELECT_COLOR;
////    recordNC.navigationBar.translucent = NO;
////    [recordNC.navigationBar setBackgroundImage:[[UIImage alloc]init]
////                                 forBarMetrics:UIBarMetricsDefault];
////    recordNC.navigationBar.shadowImage = [[UIImage alloc] init];
////    recordNC.navigationBar.tintColor = NAVTITLE_TINTCOLOR;
////    
////    [self presentViewController:recordNC animated:YES completion:nil];
//    //    [self.navigationController pushViewController:recordVC animated:YES];
//}
//
//- (void)pushEditArticleViewController
//{
//    EditArticlesViewController *recordVC = [[EditArticlesViewController alloc]init];
////    recordVC.navigationItem.backBarButtonItem.title = @"back";
////    self.navigationController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    //    UINavigationController *recordNC = [[UINavigationController alloc]initWithRootViewController:recordVC];
//    //    recordNC.navigationBar.barTintColor = ITEM_SELECT_COLOR;
//    //    recordNC.navigationBar.translucent = NO;
//    //    [recordNC.navigationBar setBackgroundImage:[[UIImage alloc]init]
//    //                                 forBarMetrics:UIBarMetricsDefault];
//    //    recordNC.navigationBar.shadowImage = [[UIImage alloc] init];
//    //    recordNC.navigationBar.tintColor = NAVTITLE_TINTCOLOR;
//    
//    //    [self presentViewController:recordNC animated:YES completion:nil];
//    [self.navigationController pushViewController:recordVC animated:YES];
//}
//
//- (void)pushAddFriendViewController
//{
//    BFriendAddViewController *BFAddVC = [[BFriendAddViewController alloc]init];
//    BFAddVC.coordinate = LOCATION.coordinate;
//    [self.navigationController pushViewController:BFAddVC animated:YES];
//}
//
//- (void)pushBookPayViewController
//{
//    BookPayViewController *bookPayVC = [[BookPayViewController alloc]init];
//    [self.navigationController pushViewController:bookPayVC animated:YES];
//}

@end
