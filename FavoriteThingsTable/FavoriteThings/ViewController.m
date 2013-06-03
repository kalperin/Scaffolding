//
//  ViewController.m
//  FavoriteThings
//
//  Created by keith Alperin on 5/5/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSMutableArray* favoriteThings;

-(void)updateDisplayedFavoriteThings;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.favoriteThings = [NSMutableArray array];
}

-(void)updateDisplayedFavoriteThings
{
//	NSString *formattedFavoriteThings = [self.favoriteThings componentsJoinedByString:@"\n"];
//	self.textView.text = formattedFavoriteThings;

//	NSMutableString *formattedFavoriteThings = [NSMutableString stringWithString:@""];
//	for (NSString* favoriteThing in self.favoriteThings) {
//		[formattedFavoriteThings appendFormat:@"%@\n", favoriteThing];
//		
//	}
//	self.textView.text = formattedFavoriteThings;

	[self.tableView reloadData];
	
}

- (IBAction)add:(id)sender
{
	[self.favoriteThings addObject:self.textField.text];
	self.textField.text = nil;
	[self updateDisplayedFavoriteThings];
}

- (IBAction)subtract:(id)sender {
	[self.favoriteThings removeLastObject];
	self.textField.text = nil;
	[self updateDisplayedFavoriteThings];
}

- (IBAction)reverse:(id)sender {
//	self.favoriteThings = [NSMutableArray arrayWithArray:[[self.favoriteThings reverseObjectEnumerator] allObjects]];
	NSMutableArray *newFavoriteThings = [NSMutableArray array];
	
	for (NSInteger i=(self.favoriteThings.count - 1); i>=0; i--) {
		[newFavoriteThings addObject:[self.favoriteThings objectAtIndex:i]];
	}
	self.favoriteThings = newFavoriteThings;
	
	[self updateDisplayedFavoriteThings];
}

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.favoriteThings.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *reuseIdentifier = @"cellReuseIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	}
	
	cell.textLabel.text = self.favoriteThings[indexPath.row];
	
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString* currentValue = [self.favoriteThings objectAtIndex:indexPath.row];
	EditViewController *editViewController = [[EditViewController alloc] initWithFavoriteThingsEditingDelegate:self
																									 indexPath:indexPath
																								  initialValue:currentValue];
	[self.navigationController pushViewController:editViewController animated:YES];
}

#pragma mark FavoriteThingsEditingDelegate methods
-(void)updateItemAtIndexPath:(NSIndexPath*)indexPath toValue:(NSString *)value
{
	self.favoriteThings[indexPath.row] = value;
	[self updateDisplayedFavoriteThings];
	
	[self.navigationController popToViewController:self animated:YES];
}


@end
