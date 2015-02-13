//
//  BookmarkEntry.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/12/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "BookmarkEntry.h"

@implementation BookmarkEntry

@dynamic title;
@dynamic date;

- (NSString *)sectionName {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM yyyy"];
    return [dateFormatter stringFromDate:date];
}

@end
