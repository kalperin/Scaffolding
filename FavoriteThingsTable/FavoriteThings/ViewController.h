//
//  ViewController.h
//  FavoriteThings
//
//  Created by keith Alperin on 5/5/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteThingsEditingDelegate.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, FavoriteThingsEditingDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)add:(id)sender;
- (IBAction)subtract:(id)sender;
- (IBAction)reverse:(id)sender;

@end
