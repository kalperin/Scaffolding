//
//  ViewController.h
//  BlockHackwich
//
//  Created by keith Alperin on 5/13/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic,strong)IBOutlet UITextField* firstNumber;
@property(nonatomic,strong)IBOutlet UITextField* secondNumber;
@property(nonatomic,strong)IBOutlet UITextField* result;

@property(nonatomic,strong)IBOutlet UIButton* addButton;
@property(nonatomic,strong)IBOutlet UIButton* subtractButton;
@end
