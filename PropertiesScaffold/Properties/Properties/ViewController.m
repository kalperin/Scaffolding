//
//  ViewController.m
//  Properties
//
//  Created by Don Bora on 4/23/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "TargetViewController.h"

@interface ViewController ()
{
    IBOutlet UITextField *textField;
    
    TargetViewController* targetViewController;
    
}
- (IBAction)show:(id)sender;
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

- (IBAction)show:(id)sender
{
    targetViewController = [[TargetViewController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:targetViewController.view];
}


- (void)dealloc {
    [textField release];
    [super dealloc];
}
@end
