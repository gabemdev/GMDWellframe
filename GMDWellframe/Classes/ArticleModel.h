//
//  ArticleModel.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/12/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleModel : NSObject

+ (ArticleModel *)sharedInstance;

@property (nonatomic) NSString *articleTitle;
@property (nonatomic) NSString *articleDescription;
@property (nonatomic) NSURL *articleImage;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
