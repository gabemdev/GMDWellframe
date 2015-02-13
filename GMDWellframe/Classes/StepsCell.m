//
//  StepsCell.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "StepsCell.h"
#import "GMDKit.h"

@implementation StepsCell

- (UILabel *)stepsLabel {
    if (!_stepsLabel) {
        _stepsLabel = [[UILabel alloc] init];
        _stepsLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _stepsLabel.textColor = [UIColor GMDKitColorWithHex:@"3B7ADA"];
        _stepsLabel.textAlignment = NSTextAlignmentCenter;
        _stepsLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:30];
    }
    return _stepsLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _detailLabel.textColor = [UIColor GMDKitTextColor];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.font = [UIFont fontWithName:@"Avenir-Light" size:25];
    }
    return _detailLabel;
}

- (UICountingLabel *)stepLabel {
    if (!_stepLabel) {
        _stepLabel = [[UICountingLabel alloc] init];
        _stepLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _stepLabel.format = @"%d";
        _stepLabel.method = UILabelCountingMethodEaseOut;
        _stepLabel.textColor = [UIColor GMDKitColorWithHex:@"3B7ADA"];
        _stepLabel.textAlignment = NSTextAlignmentCenter;
        _stepLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:30];
        _stepLabel.text = @"00000";
    }
    return _stepLabel;
}

- (ProgressBar *)progressView {
    if (!_progressView) {
        _progressView = [[ProgressBar alloc] init];
        _progressView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _progressView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        [self loadViews];
        [self loadConstraints];
        [self createBarView];

    }
    return self;
}

#pragma mark - LoadViews
- (void)loadViews {
    [self addSubview:self.stepLabel];
    [self addSubview:self.stepsLabel];
    [self addSubview:self.progressView];
    [self sendSubviewToBack:self.progressView];
    [self addSubview:self.detailLabel];

}

#pragma mark - AutoLayout
- (void)loadConstraints {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stepLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stepLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stepLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:60.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stepLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stepsLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stepsLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stepsLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:60.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stepsLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.0 constant:100.0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.progressView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.progressView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:2]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.0 constant:40]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    

}

- (void)createBarView {
    self.progressView = [[ProgressBar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];

}

- (void)updateGoalBarWithFromValue:(float)fromValue andToValue:(float)toValue {
    [self.progressView updateFillFrom:fromValue to:toValue];
}

- (void)updateStepLabels:(NSArray *)texts {
    NSInteger stepFromValue = [[texts objectAtIndex: 0] integerValue];
    NSInteger stepToValue = [[texts objectAtIndex: 1] integerValue];
    [self.stepLabel countFrom:stepFromValue to:stepToValue withDuration: animationDuration];
}

@end
