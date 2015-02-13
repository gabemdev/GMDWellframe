//
//  ProgressBar.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "ProgressBar.h"



@implementation ProgressBar
{
    float width;
    float height;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        width = frame.size.width;
        height = frame.size.height;

        self.outline = [CALayer layer];
        self.outline.frame = CGRectMake(0, 0, width, height);
        self.outline.backgroundColor = [[UIColor colorWithRed:0.86 green:0.86 blue:0.86 alpha:0.3f] CGColor];
        self.outline.masksToBounds = YES;

        self.fill = [CALayer layer];
        self.fill.anchorPoint = CGPointMake(0, 0);
        self.fill.frame = CGRectMake(0.0, 0.0, 0.0, height);
        self.fill.backgroundColor = [UIColor GMDKitColorWithHex:@"3B7ADA"].CGColor;

        [self.outline addSublayer:self.fill];
        [self.layer addSublayer: _outline];
    }
    return self;
}

- (void)updateFillFrom:(float)fromValue to:(float)toValue {
    self.fill.frame = CGRectMake(0, 0, toValue * width, height);
    [self resizeLayer:self.fill to: CGSizeMake(fromValue * width, height)];
}

- (void)resizeLayer:(CALayer *)layer to:(CGSize)size {

    // Prepare the animation from the old size to the new size
    CGRect oldBounds = layer.bounds;
    oldBounds.size = size;
    CGRect newBounds = layer.bounds;

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.duration = animationDuration;
    animation.fromValue = [NSValue valueWithCGRect:oldBounds];
    animation.toValue = [NSValue valueWithCGRect:newBounds];
    animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];

    // Update the layer's bounds so the layer doesn't snap back when the animation completes.
    layer.bounds = newBounds;

    // Add the animation, overriding the implicit animation.
    [layer addAnimation:animation forKey:@"bounds"];
}

@end
