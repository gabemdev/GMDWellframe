//
//  ArticleCell.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "ArticleCell.h"

@implementation ArticleCell

- (UILabel *)articleTitle {
    if (!_articleTitle) {
        _articleTitle = [[UILabel alloc] init];
        _articleTitle.frame = CGRectMake(0, 0, 200, 40);
        _articleTitle.textColor = [UIColor GMDKitColorWithHex:@"3B7ADA"];
        _articleTitle.font = [UIFont fontWithName:@"Avenir-Medium" size:20.0];
        _articleTitle.numberOfLines = 0;
        _articleTitle.textAlignment = NSTextAlignmentLeft;
        _articleTitle.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _articleTitle;
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

#pragma mark - LoadViews
- (void)loadViews {
    [self addSubview:self.articleTitle];
}

#pragma mark - AutoLayout
- (void)loadConstraints {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.articleTitle attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.articleTitle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.articleTitle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:60.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.articleTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-10]];

}

@end
