//
//  ViewController.m
//  Palindrome
//
//  Created by Don Bora on 4/28/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *inputTextField;
    __weak IBOutlet UILabel *palindroneLabel;
}
- (IBAction)check:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showIsPalindrone
{
    palindroneLabel.text = @"Not a palindrone!";
}

-(void)showIsNotPalindrone
{
    palindroneLabel.text = @"IS a palindrone!";
}

- (IBAction)check:(id)sender
{
    const char* arrayOfCharacters = [inputTextField.text UTF8String];
    BOOL isPalindrome = NO;
    
    
    // Insert code in here to check the characters of the array
    
    if (isPalindrome) {
        [self showIsPalindrone];
    }
    else{
        [self showIsPalindrone];
    }
}
@end
