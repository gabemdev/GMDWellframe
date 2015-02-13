//
//  ArticleModel.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/12/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel

+ (ArticleModel *)sharedInstance {
    static dispatch_once_t once;
    static ArticleModel *instance;
    dispatch_once(&once, ^{
        if (!instance) {
            instance = [[ArticleModel alloc] init];
        }
    });
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _articleTitle = dictionary[@"talk"][@"name"];
        _articleDescription = [NSString stringWithFormat:@"%@", dictionary[@"talk"][@"description"]];
    }
    return self;
}

@end
