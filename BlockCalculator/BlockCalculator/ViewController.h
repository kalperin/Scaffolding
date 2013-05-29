//
//  ViewController.h
//  BlockCalculator
//
//  Created by keith Alperin on 5/13/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UILabel *number0label;
@property (strong, nonatomic) IBOutlet UILabel *number1Label;
@property (strong, nonatomic) IBOutlet UILabel *operationLabel;

- (IBAction)enterNumberWithButton:(id)sender;
- (IBAction)enterOperationWithButton:(id)sender;

- (IBAction)equalsWithButton:(id)sender;
- (IBAction)clearWithButton:(id)sender;
@end
