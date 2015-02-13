//
//  VideoCell.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell

@property (nonatomic) UIImageView *videoImage;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) NSString *videoURL;
@property (nonatomic) UIButton *addButton;

- (void)getData:(NSDictionary *)data;

@end
