//
//  MainViewController.m
//  GMDWellframe
//
//  Created by Rockstar. on 2/11/15.
//  Copyright (c) 2015 Gabe Morales. All rights reserved.
//

#import "MainViewController.h"
#import "GMDKit.h"
#import "VideoAPI.h"
#import "VideoModel.h"
#import "ArticleModel.h"
#import "VideoCell.h"
#import "StepsCell.h"
#import "ArticleCell.h"
#import <MediaPlayer/MediaPlayer.h>
#import "UIImageView+AFNetworking.h"
#import "AppDelegate.h"
#import "YTVimeoExtractor.h"
#import "DetailViewController.h"
#import "BookmarkEntry.h"
#import "CoreDataStack.h"



@interface MainViewController ()
@property (nonatomic) NSString *numberOfSteps;

@end

@implementation MainViewController

- (UITableView *)table {
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
        _table.translatesAutoresizingMaskIntoConstraints = NO;
        _table.backgroundColor = [UIColor GMDKitBackgroundColor];
        _table.delegate = self;
        _table.dataSource = self;
        _table.scrollEnabled = YES;
        [_table registerClass:[VideoCell class] forCellReuseIdentifier:@"videoCell"];
        [_table registerClass:[StepsCell class] forCellReuseIdentifier:@"stepCell"];
        [_table registerClass:[ArticleCell class] forCellReuseIdentifier:@"articleCell"];
        _table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _table.separatorColor = [UIColor GMDKitColorWithHex:@"3B7ADA"];
    }
    return _table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Main"]];
    [self.view addSubview:self.table];
    [self loadConstraints];

    [self setUpHealthKit];

    self.videoArray = [[NSMutableArray alloc] init];
    self.articleArray = [[NSMutableArray alloc] init];
    [self loadFeed];
    [self loadArticles];

    _internetReach = [Reachability reachabilityForInternetConnection];
    [_internetReach startNotifier];
    NetworkStatus netStatus = [_internetReach currentReachabilityStatus];
    switch (netStatus)
    {
        case ReachableViaWWAN:
        {
            break;
        }
        case ReachableViaWiFi:
        {
            break;
        }
        case NotReachable:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"No internet connection detected. Some functionality will be limited until a connection is made." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            break;
        }
    }

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}


#pragma mark - TableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return self.videoArray.count;
    }
    else if (section == 2) {
        return self.articleArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *stepIdentifier = @"stepCell";
    static NSString *videoIdentifier = @"videoCell";
    static NSString *articleIdentifier = @"articleCell";

    //Step Section
    if (indexPath.section == 0) {
        StepsCell *cell = [_table dequeueReusableCellWithIdentifier:stepIdentifier];
        if (!cell) {
            cell.backgroundColor = [UIColor GMDKitBackgroundColor];
            cell.detailLabel.textColor = [UIColor redColor];
        }
        if (indexPath.row == 0) {
            [self getStepCountWithCompletion:^(double totalSteps, NSError * error) {
                dispatch_async(dispatch_get_main_queue(), ^{
//                    self.numberOfSteps = [NSString stringWithFormat:@"%1.0f Steps Taken Today!", totalSteps];
                    [cell.stepLabel countFrom:0 to:totalSteps];
                    cell.stepsLabel.text = @"Steps: ";

                    if (totalSteps <= 500) {
                        cell.detailLabel.text = @"You can do better!";
                    } else if (totalSteps > 500 && totalSteps <= 2500) {
                        cell.detailLabel.text = @"Good Job!, Keep it up!";
                    } else if (totalSteps > 2500 && totalSteps <= 5000) {
                        cell.detailLabel.text = @"Amazing! Now do it again!";
                    } else {
                        cell.detailLabel.text = @"Beyond belief! Way to go!";
                    }

                });
            }];
        }
        return cell;
    }

    //Video Section
    else if (indexPath.section == 1) {
        VideoCell *cell = [_table dequeueReusableCellWithIdentifier:videoIdentifier];
        if (!cell) {
            cell.backgroundColor = [UIColor GMDKitBackgroundColor];
        }
//        [cell getData:[self.videoArray objectAtIndex:indexPath.row]];
        VideoModel *model = [_videoArray objectAtIndex:indexPath.row];
        [cell.videoImage setImageWithURL:model.videoThumbnail placeholderImage:nil];
        cell.titleLabel.text = model.videoTitle;
        [cell.addButton addTarget:self action:@selector(addBookmark:) forControlEvents:UIControlEventTouchUpInside];

        return cell;
    }

    // Article Section
    else if (indexPath.section == 2) {
        ArticleCell *cell = [_table dequeueReusableCellWithIdentifier:articleIdentifier];
        if (!cell) {
            cell.backgroundColor = [UIColor GMDKitBackgroundColor];
        }
        ArticleModel *model = [_articleArray objectAtIndex:indexPath.row];
        cell.articleTitle.text = model.articleTitle;


        
        return cell;

    }
    return nil;
}


#pragma mark - UITableView Delegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Steps";
    }
    else if (section == 1) {
        return @"Video";
    }
    else if (section == 2) {
        return @"Articles";
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 90;
    }
    else if (indexPath.section == 1) {
        return 80;
    }
    else if (indexPath.section == 2) {
        return 70;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return;
    }
    else if (indexPath.section == 1) {
        VideoModel *model = _videoArray[indexPath.row];
        [YTVimeoExtractor fetchVideoURLFromURL:model.videoURL
                                       quality:YTVimeoVideoQualityMedium
                             completionHandler:^(NSURL *videoURL, NSError *error, YTVimeoVideoQuality quality) {
                                 if (error) {

                                 } else {
                                     [self loadVideoPlayerplayURL:videoURL];

                                 }
                             }];

    } else if (indexPath.section == 2) {
        ArticleModel *model = _articleArray[indexPath.row];
        DetailViewController *detail = [[DetailViewController alloc] initWithTitle:model.articleTitle itemDescription:model.articleDescription];
        NSLog(@"%@ %@", model.articleTitle, model.articleDescription);
        [self.navigationController pushViewController:detail animated:YES];
        [_table deselectRowAtIndexPath:indexPath animated:YES];
        
        
    }
}

#pragma mark - HealthKit
- (NSSet *)dataTypesToWrite
{
    HKQuantityType *stepCountType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];

    return [NSSet setWithObjects:stepCountType, nil];
}

- (NSSet *)dataTypesToRead
{
    HKQuantityType *stepCountType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];

    return [NSSet setWithObjects:stepCountType, nil];
}

- (void)setUpHealthKit {
    if(NSClassFromString(@"HKHealthStore") && [HKHealthStore isHealthDataAvailable])
    {
        [self requestAuthorization];
    }

}

- (void)requestAuthorization {

    self.healthStore = [[HKHealthStore alloc] init];

    NSSet *writeDataTypes = [self dataTypesToWrite];
    NSSet *readDataTypes = [self dataTypesToRead];

    [self.healthStore requestAuthorizationToShareTypes:writeDataTypes readTypes:readDataTypes completion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"You didn't allow HealthKit to access these read/write data types. In your app, try to handle this error gracefully when a user decides not to provide access. The error was: %@. If you're using a simulator, try it on a device.", error);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                            message:@"You didn't allow access to HealthKit"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            return;
        }
    }];
}


- (void)getStepCountWithCompletion:(void(^)(double, NSError *))completion {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];

    NSDate *startDate = [calendar dateFromComponents:components];
    NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:startDate options:0];

    HKQuantityType *sampleType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionStrictStartDate];

    HKStatisticsQuery *query = [[HKStatisticsQuery alloc] initWithQuantityType:sampleType quantitySamplePredicate:predicate options:HKStatisticsOptionCumulativeSum completionHandler:^(HKStatisticsQuery *query, HKStatistics *result, NSError *error) {

        if (completion && error) {
            completion(0.0f, error);
            return;
        }

        double totalSteps = [result.sumQuantity doubleValueForUnit:[HKUnit countUnit]];

        if (completion) {
            completion(totalSteps, error);
        }
    }];
    
    [self.healthStore executeQuery:query];
}

#pragma mark - Load Video Feed
- (void)loadFeed {
    [[VideoAPI sharedInstance] requestVideosWithUrl:[NSString stringWithFormat:@"http://vimeo.com/api/v2/tedtalks/videos.json"] withCompletion:^(BOOL success, NSData *response, NSError *error) {
        NSArray *dictArray = (NSArray *)response;
        for (id videoDict in dictArray) {
            VideoModel *model = [[VideoModel alloc] initWithDictionary:videoDict];
            if (![self.videoArray containsObject:model]) {
                [self.videoArray addObject:model];
            }
        }
        [_table reloadData];
    }];
}

#pragma mark - Article Feed
- (void)loadArticles {

    NSURL *url = [[NSURL alloc]
                  initWithString:
                  @"https://api.ted.com/v1/search.json?q=technology&categories=talks&api-key=w32rtm8cyjzn5pyjcj5e53z2"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject[@"results"]);
        NSArray *items = responseObject[@"results"];
        for (NSDictionary *item in items) {
            ArticleModel *model = [[ArticleModel alloc] initWithDictionary:item];
            if (![self.articleArray containsObject:model]) {
                [self.articleArray addObject:model];
            }
        }
        [_table reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"Oops, something went wrong: %@", [error localizedDescription]);
    }];
    [operation start];
}

#pragma mark - Video Player
- (void)loadVideoPlayerplayURL:(NSURL *)url {
    MPMoviePlayerViewController *media = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [media.moviePlayer setAllowsAirPlay:YES];
    [[media view] setFrame:[self.view bounds]];
    [media.moviePlayer prepareToPlay];
    [media.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self presentMoviePlayerViewControllerAnimated:media];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackStateChange:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:[media moviePlayer]];



}

- (void)moviePlayBackStateChange:(NSNotification *)notification
{
    MPMoviePlayerController *player = notification.object;
    //are we currently playing?
    if (player.playbackState == MPMoviePlaybackStatePlaying)
    { //yes->do something as we are playing...
    }
    else if (player.playbackState == MPMoviePlaybackStateStopped)
    { //nope->do something else since we are not playing
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops"
                                                                       message:@"Feed is not available at this time"
                                                                preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK Button");
        }];
        [alert addAction:okButton];

        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - AutoLayout
- (void)loadConstraints {
    NSDictionary *viewDict = @{@"table": _table};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
}

#pragma mark - Actions
- (void)addBookmark:(id)sender {
    
}

@end
