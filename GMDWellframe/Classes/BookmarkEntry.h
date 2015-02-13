//
//  BookmarkEntry.h
//  GMDWellframe
//
//  Created by Rockstar. on 2/12/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface BookmarkEntry : NSManagedObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic) NSTimeInterval date;

@property (nonatomic, readonly) NSString *sectionName;
@end
