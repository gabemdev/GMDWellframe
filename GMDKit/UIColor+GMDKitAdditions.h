//
//  UIColor+GMDKitAdditions.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GMDKitAdditions)

+ (UIColor *)GMDKitColorWithHex:(NSString *)hex;
+ (UIColor *)GMDKitTextColor;
+ (UIColor *)GMDKitBackgroundColor;

@end
