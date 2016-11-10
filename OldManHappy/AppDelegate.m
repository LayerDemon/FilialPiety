//
//  AppDelegate.m
//  OldManHappy
//
//  Created by zhangyi on 16/11/6.
//  Copyright © 2016年 zhangyi. All rights reserved.
//

#import "AppDelegate.h"

#import "HappyLifeViewController.h"
#import "OldToOldViewController.h"
#import "OldFriendCicleViewController.h"
#import "MySelfViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    [self setRootVC];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)setRootVC
{
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    HappyLifeViewController * homeVC = [[HappyLifeViewController alloc] init];
    UINavigationController * homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.navigationBar.tintColor = [UIColor whiteColor];
    homeNav.navigationBar.barTintColor = THEMECOLOR_TINT;
    homeNav.tabBarItem.title=@"悦生活";
    homeNav.tabBarItem.image = [UIImage imageNamed:@"促销"];
    homeNav.navigationBar.titleTextAttributes = dict;        //改变title的颜色
    
    OldToOldViewController * checkDataVC = [[OldToOldViewController alloc] init];
    UINavigationController * checkNav = [[UINavigationController alloc] initWithRootViewController:checkDataVC];
    checkNav.navigationBar.tintColor = NAVTITLE_TINTCOLOR;
    checkNav.navigationBar.barTintColor = ITEM_SELECT_COLOR;
    checkNav.navigationBar.translucent = NO;
    [checkNav.navigationBar setBackgroundImage:[[UIImage alloc]init]
                                forBarMetrics:UIBarMetricsDefault];
    checkNav.navigationBar.shadowImage = [[UIImage alloc] init];
    checkNav.tabBarItem.title= @"老吾老";
    checkNav.tabBarItem.image = [UIImage imageNamed:@"商家"];
    
    
    OldFriendCicleViewController * infoVC = [[OldFriendCicleViewController alloc] init];
    UINavigationController * infoNav = [[UINavigationController alloc] initWithRootViewController:infoVC];
    infoNav.navigationBar.tintColor = NAVTITLE_TINTCOLOR;
    infoNav.navigationBar.barTintColor = ITEM_SELECT_COLOR;
    infoNav.navigationBar.translucent = NO;
    [infoNav.navigationBar setBackgroundImage:[[UIImage alloc]init]
                                forBarMetrics:UIBarMetricsDefault];
    infoNav.navigationBar.shadowImage = [[UIImage alloc] init];
    infoNav.tabBarItem.title = @"购健康";
    infoNav.tabBarItem.image = [UIImage imageNamed:@"活动"];
    
    
    MySelfViewController  * personalVC = [[MySelfViewController alloc] init];
    UINavigationController  * personalNav = [[UINavigationController alloc] initWithRootViewController:personalVC];
    personalNav.navigationBar.tintColor = [UIColor whiteColor];
    personalNav.navigationBar.barTintColor = THEMECOLOR_TINT;
    personalNav.tabBarItem.title= @"我的";
    personalNav.tabBarItem.image = [UIImage imageNamed:@"我的"];
    personalNav.navigationBar.titleTextAttributes = dict;
    
    UITabBarController * tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[checkNav,homeNav,infoNav,personalNav];
    tabVC.tabBar.tintColor = ITEM_SELECT_COLOR;
    
    self.window.rootViewController = tabVC;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
