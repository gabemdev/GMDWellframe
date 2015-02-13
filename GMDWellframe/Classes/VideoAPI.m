//
//  VideoAPI.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "VideoAPI.h"

@implementation VideoAPI

+ (VideoAPI *)sharedInstance {
    static dispatch_once_t once;
    static VideoAPI *instance;
    dispatch_once(&once, ^{
        if (!instance) {
            instance = [[VideoAPI alloc] init];
        }
    });
    return instance;
}

- (void)requestVideosWithUrl:(NSString *)url withCompletion:(CompletionBlock)comp {
    NSString *request = url;
    [self getRequest:request parameters:nil completion:^(BOOL success, NSData *response, NSError *error) {
        comp(success, response, error);
    }];

}

- (void)getRequest:(NSString *)requestPath parameters:(NSDictionary *)parameters completion:(CompletionBlock)completion {
    NSURL *url = [NSURL URLWithString:requestPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];

    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion != nil) completion(TRUE, responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure!");
        [self handleError:error];
    }];
    [op start];
    

}

#pragma mark - Network
- (void)handleError:(NSError *)error{
    // display user friendly error

    if(![AFNetworkReachabilityManager sharedManager].reachable){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please make sure you are connecting to a network." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];

    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Something went wrong , Please try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];

    }
    NSString * message = error.localizedDescription;
    // send error to the server or use some bug tracking tool.
    NSLog(@"Error = %@",message);
    
}

@end
