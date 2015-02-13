//
//  BookmarkCell.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/12/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "BookmarkCell.h"
#import "BookmarkEntry.h"
#import <QuartzCore/QuartzCore.h>

@interface BookmarkCell ()

@end

@implementation BookmarkCell

- (UILabel *)bookmarkTitle {
    if (!_bookmarkTitle) {
        _bookmarkTitle = [[UILabel alloc] init];
        _bookmarkTitle.frame = CGRectMake(0, 0, 200, 40);
        _bookmarkTitle.textColor = [UIColor GMDKitColorWithHex:@"3B7ADA"];
        _bookmarkTitle.font = [UIFont fontWithName:@"Avenir-Medium" size:20.0];
        _bookmarkTitle.numberOfLines = 0;
        _bookmarkTitle.textAlignment = NSTextAlignmentLeft;
        _bookmarkTitle.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _bookmarkTitle;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellForEntry:(BookmarkEntry *)entry {

    self.bookmarkTitle.text = entry.title;
}

@end
