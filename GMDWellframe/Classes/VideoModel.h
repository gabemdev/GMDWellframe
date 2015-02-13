//
//  VideoModel.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject
@property (nonatomic) NSString *videoTitle;
@property (nonatomic) NSString *videoDescription;
@property (nonatomic) NSURL *videoThumbnail;
@property (nonatomic) NSString *videoURL;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
