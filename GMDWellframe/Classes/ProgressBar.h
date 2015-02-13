//
//  ProgressBar.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBar : UIView

@property (nonatomic, strong) CALayer *outline;
@property (nonatomic, strong) CALayer *fill;

- (void)updateFillFrom:(float)from to:(float)to;

@end
