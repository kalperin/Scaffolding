//
//  ViewController.h
//  EvensAndOdds
//
//  Created by keith Alperin on 5/13/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^FilterBlock)(NSNumber* number);

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *evenButton;
@property (strong, nonatomic) IBOutlet UIButton *oddsButton;
@property (nonatomic, copy) FilterBlock filter;
@property(nonatomic,strong) NSMutableArray* numbers;

@end
