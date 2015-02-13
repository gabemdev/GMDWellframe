//
//  StepsCell.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressBar.h"
#import "UICountingLabel.h"

@interface StepsCell : UITableViewCell

@property (nonatomic) ProgressBar *progressView;
@property (nonatomic) UILabel *stepsLabel;
@property (nonatomic) UILabel *detailLabel;
@property (nonatomic, strong) UICountingLabel *stepLabel;

- (void)updateGoalBarWithFromValue:(float)fromValue andToValue:(float)toValue;
- (void)updateStepLabels:(NSArray *)texts;


@end
