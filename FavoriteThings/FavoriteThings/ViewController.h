//
//  ViewController.h
//  FavoriteThings
//
//  Created by keith Alperin on 5/5/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)add:(id)sender;
- (IBAction)subtract:(id)sender;
- (IBAction)reverse:(id)sender;

@end
