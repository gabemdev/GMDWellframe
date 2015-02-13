//
//  VideoModel.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "VideoModel.h"
#import "AFNetworking.h"

@implementation VideoModel

+ (VideoModel *)sharedInstance {
    static dispatch_once_t once;
    static VideoModel *instance;
    dispatch_once(&once, ^{
        if (!instance) {
            instance = [[VideoModel alloc] init];
        }
    });
    return instance;
}

#pragma mark - init
- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        _videoThumbnail = [NSURL URLWithString:[NSString stringWithFormat:@"%@", dictionary[@"thumbnail_small"]]];
        _videoTitle = dictionary[@"title"];
        _videoDescription = [NSString stringWithFormat:@"%@", dictionary[@"description"]];
        _videoURL = [NSString stringWithFormat:@"%@", dictionary[@"mobile_url"]];
    }
    return self;
}
@end
