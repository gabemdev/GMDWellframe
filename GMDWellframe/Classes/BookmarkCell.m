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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        [self loadViews];
        [self loadConstraints];

    }
    return self;
}

#pragma mark - Setup
+ (CGFloat)heightForEntry:(BookmarkEntry *)entry {
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 80.0f;
    const CGFloat minHeight = 90.0f;

    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];

    CGRect boundingBox = [entry.title boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];

    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
}

- (void)configureCellForEntry:(BookmarkEntry *)entry {

    self.bookmarkTitle.text = entry.title;
}

#pragma mark - LoadViews
- (void)loadViews {
    [self addSubview:self.bookmarkTitle];
}

#pragma mark - AutoLayout
- (void)loadConstraints {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bookmarkTitle attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bookmarkTitle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bookmarkTitle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:60.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bookmarkTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-10]];

}

@end
