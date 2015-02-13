//
//  BookmarkCell.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/12/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BookmarkEntry;
@interface BookmarkCell : UITableViewCell
@property (nonatomic) UILabel *bookmarkTitle;

+ (CGFloat)heightForEntry:(BookmarkEntry *)entry;
- (void)configureCellForEntry:(BookmarkEntry *)entry;

@end
