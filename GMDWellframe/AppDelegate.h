//
//  AppDelegate.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
@import HealthKit;
@import CoreData;

@class Reachability;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate, UITabBarDelegate>

+ (AppDelegate *)sharedDelegate;

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) UITabBarController *tabBarController;




@end

