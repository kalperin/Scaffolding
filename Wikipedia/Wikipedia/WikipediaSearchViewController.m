//
//  ViewController.m
//  Wikipedia
//
//  Created by keith Alperin on 5/15/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "WikipediaSearchViewController.h"
#import "WikipediaSearcher.h"
#import "SnippetViewController.h"

@interface WikipediaSearchViewController ()
@property(nonatomic,strong) WikipediaSearcher* searcher;
@property(nonatomic,strong) NSArray* resultsDictionaries;
-(void)updateWithResultsDictionaries:(NSArray *)resultsDictionaries;
@end

@implementation WikipediaSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.searcher = [[WikipediaSearcher alloc] init];
}

-(void)updateWithResultsDictionaries:(NSArray *)resultsDictionaries
{
	self.resultsDictionaries = resultsDictionaries;
	[self.tableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	SnippetViewController *snippetViewController = segue.destinationViewController;
	NSDictionary *resultDictionary = self.resultsDictionaries[self.tableView.indexPathForSelectedRow.row];
	snippetViewController.articleTitle = [resultDictionary objectForKey:@"title"];
	snippetViewController.snippet = [resultDictionary objectForKey:@"snippet"];
	
}

#pragma mark actions
- (IBAction)searchWithButton:(id)sender {
	[self.textField resignFirstResponder];
	[self.activityIndicator startAnimating];
	NSString *searchTerm = self.textField.text;
	self.resultsDictionaries = [NSArray array];
	if (self.tableView.numberOfSections > 0) {
		[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
	}
	
	__weak WikipediaSearchViewController* weakSelf = self;
	
	[self.searcher searchWithSearchTerm:searchTerm
					  completionHandler:^(NSArray *resultsDictionaries) {
						  [weakSelf.activityIndicator stopAnimating];

						  [weakSelf updateWithResultsDictionaries:resultsDictionaries];
					  }];
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
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WikipediaCellIdentifier"];
	cell.textLabel.text = [self.resultsDictionaries[indexPath.row] objectForKey:@"title"];
	return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	
//}
@end
