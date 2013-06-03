//
//  ViewController.m
//  TableHackwich
//
//  Created by keith Alperin on 5/5/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSMutableArray* items;
@property(nonatomic,strong) NSArray* titles;

-(NSInteger)sectionForButton:(UIButton*)button;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.items = [NSMutableArray arrayWithObjects:[NSMutableArray array],[NSMutableArray array], nil];
	self.titles = @[@"Section 1",@"Section 2"];
	
}

-(NSInteger)sectionForButton:(UIButton*)button
{
	NSInteger section = NSNotFound;
	
	if ([self.button1 isEqual:button]) {
		section = 0;
	} else if ([self.button2 isEqual:button]) {
		section = 1;
	}
	
	return section;
}

#pragma mark Table
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.items.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.items[section] count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return self.titles[section];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *reuseIdentifier = @"cellReuseIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	}
	
	NSString *text = self.items[indexPath.section][indexPath.row];
	cell.textLabel.text = text;
	
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *text = self.items[indexPath.section][indexPath.row];
	NSLog(@"%@ is in section %i", text, indexPath.section);
}


#pragma mark Actions
- (IBAction)add:(id)sender {
	
	NSInteger section = [self sectionForButton:sender];
	
	NSArray *indexPathsToInsert = nil;
	
	if (section == NSNotFound) {
		[self.items[0] addObject:self.textField.text];
		[self.items[1] addObject:self.textField.text];
		NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:[self.items[0] count] - 1 inSection:0];
		NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:[self.items[1] count] - 1 inSection:1];
		indexPathsToInsert = @[indexPath0, indexPath1];

	} else {
		[self.items[section] addObject:self.textField.text];
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.items[section] count] - 1 inSection:section];
		indexPathsToInsert = @[indexPath];
	}
	
	
	[self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:UITableViewRowAnimationAutomatic];
	self.textField.text = nil;
}
@end
