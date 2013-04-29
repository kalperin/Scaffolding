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
    __weak IBOutlet UILabel *resultLabel;
    
    int result;
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
    resultLabel.text = @"Not a palindrone!";
}

-(void)showIsNotPalindrone
{
    resultLabel.text = @"IS a palindrone!";
}


-(const char*)getCharacterArray
{
    return [inputTextField.text UTF8String];
}


-(void)showResult
{
    resultLabel.text = [NSString stringWithFormat:@"%i", result];
}


-(void)checkForPalindrone
{
    const char* arrayOfCharacters = [self getCharacterArray];
    BOOL isPalindrome = NO;
    
    
    // Insert code in here to check the characters of the array for palindronishness
    
    
    if (isPalindrome) {
        [self showIsPalindrone];
    }
    else{
        [self showIsPalindrone];
    }    
}


-(void)sumIntegers
{
    const char* arrayOfCharacters = [self getCharacterArray];
    
    // parse out the commas, sum up the integers and assign the answer to the variable result
    // i.e.
    // result = 
}

- (IBAction)check:(id)sender
{
    [self checkForPalindrone];
}
@end