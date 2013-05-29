//
//  ViewController.h
//  AppDotNet
//
//  Created by keith Alperin on 5/16/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDotNetClient.h"

@interface AppDotNetPublicTimelineViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong) AppDotNetClient* appDotNetClient;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,strong) NSArray* resultsDictionaries;

- (IBAction)refreshWithButton:(id)sender;

@end
