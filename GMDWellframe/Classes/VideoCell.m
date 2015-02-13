//
//  VideoCell.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "VideoCell.h"
#import "UIImageView+AFNetworking.h"
#import "VideoModel.h"
#import "GMDKit.h"

@implementation VideoCell

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(0, 0, 200, 40);
        _titleLabel.textColor = [UIColor GMDKitColorWithHex:@"3B7ADA"];
        _titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:15.0];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _titleLabel;
}

- (UIImageView *)videoImage {
    if (!_videoImage) {
        _videoImage = [[UIImageView alloc] init];
        _videoImage.frame = CGRectMake(0, 0, 80, 80);
        _videoImage.contentMode = UIViewContentModeScaleAspectFit;
        _videoImage.translatesAutoresizingMaskIntoConstraints = NO;
        _videoImage.clipsToBounds = YES;
    }
    return _videoImage;
}

- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        _addButton.tintColor = [UIColor GMDKitColorWithHex:@"3B7ADA"];
        _addButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _addButton;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        [self loadViews];
        [self loadConstraints];

    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)getData:(VideoModel *)data {
    self.titleLabel.text = data.videoTitle;
    self.videoURL = data.videoURL;
    [self.videoImage setImageWithURL:data.videoThumbnail placeholderImage:nil];

}


#pragma mark - LoadViews
- (void)loadViews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.videoImage];
    [self addSubview:self.addButton];

}

#pragma mark - AutoLayout
- (void)loadConstraints {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:100]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:80.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.0 constant:220]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.videoImage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.videoImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:80.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.videoImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.0 constant:80.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.videoImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:22]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.0 constant:22]];
}

@end
