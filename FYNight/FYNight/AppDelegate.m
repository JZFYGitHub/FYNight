//
//  AppDelegate.m
//  FYNight
//
//  Created by dllo on 15/11/16.
//  Copyright © 2015年 直到世界的尽头. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //获取夜间模式状态
    [ThemeManage shareThemeManage].isNight = [[NSUserDefaults standardUserDefaults] boolForKey:@"night"];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    //设置navigationBar的夜间模式状态
    [nav.navigationBar NightWithType:UIViewColorTypeNormal];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:secondVC];
    [nav1.navigationBar NightWithType:UIViewColorTypeNormal];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController.tabBar NightWithType:UIViewColorTypeNormal];
    tabBarController.viewControllers = @[nav, nav1];
    tabBarController.tabBar.translucent = NO;
    [[UINavigationBar appearance] setTranslucent:NO];
    _window.rootViewController = tabBarController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
