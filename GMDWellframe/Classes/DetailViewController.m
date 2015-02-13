//
//  DetailViewController.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/12/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "DetailViewController.h"
#import "BookmarkEntry.h"
#import "CoreDataStack.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (UILabel *)itemTitle {
    if (!_itemTitle) {
        _itemTitle = [[UILabel alloc] init];
        _itemTitle.frame = CGRectMake(0, 0, 200, 50);
        _itemTitle.textAlignment = NSTextAlignmentCenter;
        _itemTitle.textColor = [UIColor GMDKitTextColor];
        _itemTitle.font = [UIFont fontWithName:@"Avenir-Medium" size:20.0f];
        _itemTitle.numberOfLines = 0;
        _itemTitle.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _itemTitle;
}

- (UITextView *)itemDescription {
    if (!_itemDescription) {
        _itemDescription = [[UITextView alloc] init];
        _itemDescription.backgroundColor = [UIColor clearColor];
        _itemDescription.textColor = [UIColor GMDKitTextColor];
        _itemDescription.font = [UIFont fontWithName:@"Avenir-Book" size:18];
        _itemDescription.textAlignment = NSTextAlignmentLeft;
        _itemDescription.editable = NO;
        _itemDescription.selectable = NO;
        _itemDescription.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _itemDescription.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _itemDescription;
}

#pragma mark - UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor GMDKitBackgroundColor];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBookmark:)];

    [self loadViews];
    [self loadConstraints];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithTitle:(NSString *)articleTitle itemDescription:(NSString *)articleDescription {
    self.itemTitle.text = articleTitle;
    self.itemDescription.text = articleDescription;
    return self;
}

#pragma mark - Views
- (void)loadViews {
    [self.view addSubview:self.itemTitle];
    [self.view addSubview:self.itemDescription];
}

#pragma mark - Actions
- (void)addBookmark:(id)sender {
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    BookmarkEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"BookmarkEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.title = self.itemTitle.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [coreDataStack saveContext];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bookmark added"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];



}

#pragma mark - AutoLayout
- (void)loadConstraints {
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.itemTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.itemTitle attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:5]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.itemTitle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:60]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.itemTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-20.0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.itemDescription attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.itemDescription attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.itemTitle attribute:NSLayoutAttributeTop multiplier:1.0 constant:70]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.itemDescription attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0 constant:400]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.itemDescription attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-20]];
}



@end
