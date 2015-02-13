//
//  MainViewController.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
@import HealthKit;

@class BookmarkEntry;

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) BookmarkEntry *entry;
@property (nonatomic) Reachability *internetReach;

@property (nonatomic) UITableView *table;
@property (nonatomic) NSMutableArray * videoArray;
@property (nonatomic) NSMutableArray *articleArray;
@property (nonatomic) UIActivityIndicatorView *activityIndicatorView;

@property (nonatomic) HKHealthStore *healthStore;

@end
