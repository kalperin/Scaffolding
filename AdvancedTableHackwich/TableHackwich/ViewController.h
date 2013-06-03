//
//  ViewController.h
//  TableHackwich
//
//  Created by keith Alperin on 5/5/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *buttonBoth;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)add:(id)sender;

@end
