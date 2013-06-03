//
//  ViewController.m
//  NotificationCenterHackwich
//
//  Created by keith Alperin on 5/29/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void)incrementCount;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter addObserverForName:UIApplicationWillEnterForegroundNotification
									object:nil
									 queue:[NSOperationQueue mainQueue]
								usingBlock:^(NSNotification *note) {
									[self incrementCount];
								}];
}

-(void)dealloc
{
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter removeObserver:self];
	
}

-(void)incrementCount
{
	NSInteger count = [self.label.text integerValue];
	count++;
	self.label.text = [NSString stringWithFormat:@"%i",count];
}
@end
