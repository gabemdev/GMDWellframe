//
//  VideoAPI.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface VideoAPI : NSObject
typedef void(^CompletionBlock)(BOOL success, NSData * response, NSError * error );

+ (VideoAPI *)sharedInstance;
@property (nonatomic,strong) AFHTTPRequestSerializer * requestSerializer;
- (void)requestVideosWithUrl:(NSString *)url withCompletion:(CompletionBlock)comp;

@end
