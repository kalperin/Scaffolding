//
//  ViewController.m
//  AsynchronicityHackwich
//
//  Created by keith Alperin on 5/29/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSOperationQueue* operationQueue;
-(void)loadSynchronous;
-(void)loadInOperationQueue;
-(void)loadAsynchronous;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.operationQueue = [[NSOperationQueue alloc] init];
	[self.operationQueue setMaxConcurrentOperationCount:1];
	[self.operationQueue setSuspended:NO];
	[self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitWithButton:(id)sender {
	
	[self loadInOperationQueue];


}

-(void)loadSynchronous
{
	[self.activityIndicator startAnimating];
	
	NSURL* url = [NSURL URLWithString:self.textField.text];
	
	NSData *imageData = [NSData dataWithContentsOfURL:url];
	UIImage *image = [UIImage imageWithData:imageData];
	self.imageView.image = image;
	
	[self.activityIndicator stopAnimating];
	
}

-(void)loadInOperationQueue
{
	
	NSBlockOperation *spinOperation = [NSBlockOperation blockOperationWithBlock:^{
		NSBlockOperation *mainSpinOperation= [NSBlockOperation blockOperationWithBlock:^{
			[self.activityIndicator startAnimating];
		}];
		[[NSOperationQueue mainQueue] addOperation:mainSpinOperation];
	}];
	
	[self.operationQueue addOperation:spinOperation];
	
	NSBlockOperation *fetchOperation = [NSBlockOperation blockOperationWithBlock:^{
		NSURL* url = [NSURL URLWithString:self.textField.text];
		
		NSData *imageData = [NSData dataWithContentsOfURL:url];
		UIImage *image = [UIImage imageWithData:imageData];
		NSBlockOperation *mainFetchOperation= [NSBlockOperation blockOperationWithBlock:^{
			self.imageView.image = image;
			
			[self.activityIndicator stopAnimating];
		}];
		[[NSOperationQueue mainQueue] addOperation:mainFetchOperation];
	}];

	[self.operationQueue addOperation:fetchOperation];
	
	
	
	
}

-(void)loadAsynchronous
{
	[self.activityIndicator startAnimating];

	NSURL* url = [NSURL URLWithString:self.textField.text];

	NSURLRequest* request = [NSURLRequest requestWithURL:url];
	[NSURLConnection sendAsynchronousRequest:request
									   queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
							   UIImage *image = [UIImage imageWithData:responseData];
							   self.imageView.image = image;
							   
							   [self.activityIndicator stopAnimating];

						   }];

}

@end
