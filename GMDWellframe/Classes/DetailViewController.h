//
//  DetailViewController.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/12/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BookmarkEntry;

@interface DetailViewController : UIViewController
@property (nonatomic) UILabel *itemTitle;
@property (nonatomic) UITextView *itemDescription;

@property (nonatomic)BookmarkEntry *entry;

- (instancetype)initWithTitle:(NSString *)articleTitle itemDescription:(NSString *)articleDescription;

@end
