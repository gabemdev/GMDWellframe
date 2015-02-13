//
//  AppDelegate.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "BookmarksViewController.h"
#import "GMDKit.h"
#import "AFNetworking.h"
#import "Reachability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setTabBar];
    _window.rootViewController = _tabBarController;
    _window.backgroundColor = [UIColor whiteColor];
    [self setStyle];

    [_window makeKeyAndVisible];



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

#pragma mark - UITabBarController
- (void)setTabBar {
    UIEdgeInsets insets = UIEdgeInsetsMake(-5.0, 0, 5, 0);

    _tabBarController = [[UITabBarController alloc] init];

    UIViewController *main = [[MainViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:main];
    [mainNav.navigationBar setTranslucent:NO];
    [main.tabBarItem setImage:[[UIImage imageNamed:@"more-icon-notification-active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [main.tabBarItem setSelectedImage:[[UIImage imageNamed:@"more-icon-notification"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [main.tabBarItem setImageInsets:insets];
    [main.tabBarItem setTitle:@"Main"];

    UIViewController *bookmarks = [[BookmarksViewController alloc] init];
    UINavigationController *bookNav = [[UINavigationController alloc] initWithRootViewController:bookmarks];
    [bookNav.navigationBar setTranslucent:NO];
    [bookmarks.tabBarItem setImage:[[UIImage imageNamed:@"more-icon-purchase-active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [bookmarks.tabBarItem setSelectedImage:[[UIImage imageNamed:@"more-icon-purchase"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [bookmarks.tabBarItem setImageInsets:insets];
    [bookmarks.tabBarItem setTitle:@"Bookmarks"];

    _tabBarController.viewControllers = @[mainNav, bookNav];
}

#pragma mark - Appearance
- (void)setStyle {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];

    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarStyle:UIBarStyleBlack];
    [navBar setBarTintColor:[UIColor GMDKitColorWithHex:@"3B7ADA"]];

    [navBar setTitleTextAttributes:@{
                                     NSFontAttributeName: [UIFont fontWithName:@"Avenir-Medium" size:20],
                                     NSForegroundColorAttributeName: [UIColor whiteColor]
                                     }];

    UITabBar *tabBar = [UITabBar appearance];
    [tabBar setTintColor:[UIColor whiteColor]];
    [tabBar setBarTintColor:[UIColor GMDKitColorWithHex:@"3B7ADA"]];
    [tabBar setTranslucent:NO];

    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:@{
                                         NSForegroundColorAttributeName: [UIColor whiteColor],
                                         NSFontAttributeName: [UIFont fontWithName:@"Avenir-Medium" size:15]}
                              forState:UIControlStateNormal];

    [tabBarItem setTitleTextAttributes:@{
                                         NSForegroundColorAttributeName: [UIColor GMDKitTextColor]}
                              forState:UIControlStateSelected];

    [tabBarItem setTitlePositionAdjustment:UIOffsetMake(0.0, 0.0)];
}



@end
