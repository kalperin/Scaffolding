//
//  ViewController.m
//  CategoriesHackwich
//
//  Created by keith Alperin on 5/29/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MMExtensions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)reverseWithButton:(id)sender
{
	self.textField.text = [self.textField.text mmReversedString];
}
@end
