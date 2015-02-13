//
//  BookmarksViewController.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookmarksViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITableView *table;

@end
