//
//  ViewController.m
//  NetworkingHackwich
//
//  Created by keith Alperin on 5/15/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/api/members.json"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];

	NSURLResponse *response = nil;
	NSError *error = nil;
//	NSData *responseData = [NSURLConnection sendSynchronousRequest:request
//												 returningResponse:&response
//															 error:&error];
//
//	NSString *responseString = [[NSString alloc] initWithBytes:[responseData bytes] length:[responseData length] encoding:NSUTF8StringEncoding];
//	
//	self.textView.text = responseString;

	[NSURLConnection sendAsynchronousRequest:request
									   queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
							   NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:responseData
																								  options:0
																									error:&error];
							   
							   NSMutableString *membersString = [[NSMutableString alloc] init];
							   for (NSDictionary *memberDictionary in responseArray) {
								   NSString *memberName = [memberDictionary objectForKey:@"name"];
								   NSString *memberEmail = [memberDictionary objectForKey:@"email"];
								   [membersString appendFormat:@"%@\n%@\n\n", memberName, memberEmail];
							   }
							   self.textView.text = membersString;
						   }];
	
}

@end
