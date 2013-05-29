//
//  ViewController.m
//  AppDotNet
//
//  Created by keith Alperin on 5/16/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "AppDotNetPublicTimelineViewController.h"
@interface AppDotNetPublicTimelineViewController ()
-(void)updateWithResultsDictionaries:(NSArray *)resultsDictionaries;
-(void)refreshTimeline;
-(void)timlineForUserWithID:(NSString *)idString;
@end

@implementation AppDotNetPublicTimelineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//	NSDictionary *resultDictionary = self.resultsDictionaries[self.tableView.indexPathForSelectedRow.row];
//	NSString *idString = resultDictionary[@"user"][@"id"];
//	
//
//}

-(void)updateWithResultsDictionaries:(NSArray *)resultsDictionaries
{
	[self.activityIndicator stopAnimating];
	self.resultsDictionaries = resultsDictionaries;
	[self.tableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)refreshTimeline
{
	if (self.tableView.numberOfSections > 0) {
		self.resultsDictionaries = @[];
		[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
	}
	[self.activityIndicator startAnimating];
	__weak AppDotNetPublicTimelineViewController *weakSelf = self;
	[self.appDotNetClient publicTimelineWithCompletionHandler:^(NSArray *resultsDictionaries) {
		[weakSelf updateWithResultsDictionaries:resultsDictionaries];
	}];
}

-(void)timlineForUserWithID:(NSString *)idString
{
	[self.activityIndicator startAnimating];
	__weak AppDotNetPublicTimelineViewController *weakSelf = self;
	[self.appDotNetClient postsForUserWithID:idString completionHandler:^(NSArray *resultsDictionaries) {
		[weakSelf updateWithResultsDictionaries:resultsDictionaries];
	}];
	
}
#pragma mark actions

- (IBAction)refreshWithButton:(id)sender {
	[self refreshTimeline];
	
}

#pragma mark table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	NSInteger numberOfSections = (self.resultsDictionaries.count > 0)?1:0;
	return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.resultsDictionaries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppDotNetCellIdentifier"];
	cell.textLabel.text = [self.resultsDictionaries[indexPath.row] objectForKey:@"text"];
	cell.detailTextLabel.text = [[self.resultsDictionaries[indexPath.row] objectForKey:@"user"] objectForKey:@"username"];
	
	return cell;
}
@end
