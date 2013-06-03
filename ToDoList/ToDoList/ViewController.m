//
//  ViewController.m
//  TableHackwich
//
//  Created by keith Alperin on 5/5/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"

@interface ViewController ()
{
	
}
@property(nonatomic,strong) NSMutableArray* items;
@property(nonatomic,strong) NSArray* titles;
-(void)markDoneItemAtIndex:(NSInteger)index;
-(void)markNotDoneItemAtIndex:(NSInteger)index;
-(void)udpateTableWithInserts:(NSArray *)inserts deletes:(NSArray *)deletes;
-(void)addNewItem;
@end

NSInteger const kSectionToDo = 0;
NSInteger const kSectionDone = 1;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.items = [NSMutableArray arrayWithObjects:[NSMutableArray array],[NSMutableArray array], nil];
	self.titles = @[@"To Do",@"Already Done"];
	
	[self.textField becomeFirstResponder];
}

-(void)markDoneItemAtIndex:(NSInteger)index
{
	NSString *text = self.items[kSectionToDo][index];
	[self.items[kSectionToDo] removeObjectAtIndex:index];
	[self.items[kSectionDone] insertObject:text atIndex:0];
	NSIndexPath *indexPathToRemoveFromToDo = [NSIndexPath indexPathForRow:index inSection:kSectionToDo];
	NSIndexPath *indexPathToAddToDone = [NSIndexPath indexPathForRow:0 inSection:kSectionDone];
	
	[self udpateTableWithInserts:@[indexPathToAddToDone] deletes:@[indexPathToRemoveFromToDo]];
}

-(void)markNotDoneItemAtIndex:(NSInteger)index
{
	NSString *text = self.items[kSectionDone][index];
	[self.items[kSectionDone] removeObjectAtIndex:index];
	[self.items[kSectionToDo] insertObject:text atIndex:0];
	NSIndexPath *indexPathToRemove = [NSIndexPath indexPathForRow:index inSection:kSectionDone];
	NSIndexPath *indexPathToAdd = [NSIndexPath indexPathForRow:0 inSection:kSectionToDo];
	
	[self udpateTableWithInserts:@[indexPathToAdd] deletes:@[indexPathToRemove]];
	
}

-(void)udpateTableWithInserts:(NSArray *)inserts deletes:(NSArray *)deletes
{
	[self.tableView beginUpdates];
	
	[self.tableView deleteRowsAtIndexPaths:deletes withRowAnimation:UITableViewRowAnimationAutomatic];
	[self.tableView insertRowsAtIndexPaths:inserts withRowAnimation:UITableViewRowAnimationAutomatic];
	
	[self.tableView endUpdates];
	
}

-(void)addNewItem
{
	NSMutableArray *toDoItemsArray = self.items[kSectionToDo];
	[toDoItemsArray insertObject: self.textField.text atIndex:0];
	
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:kSectionToDo];
	
	
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	self.textField.text = nil;
	
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
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	}
	
	NSString *text = self.items[indexPath.section][indexPath.row];
	cell.textLabel.text = text;
	
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == kSectionToDo) {
		[self markDoneItemAtIndex:indexPath.row];
	} else {
		[self markNotDoneItemAtIndex:indexPath.row];
	}
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	NSString* currentValue = [[self.items objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	EditViewController *editViewController = [[EditViewController alloc] initWithEditingDelegate:self
																					   indexPath:indexPath
																					initialValue:currentValue];
	[self.navigationController pushViewController:editViewController animated:YES];
}

#pragma mark UITextField methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self addNewItem];
	
	return NO;
}

#pragma mark EditingDelegate methods
-(void)updateItemAtIndexPath:(NSIndexPath*)indexPath toValue:(NSString *)value
{
	self.items[indexPath.section][indexPath.row] = value;
	[self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

	[self.navigationController popToViewController:self animated:YES];
}

#pragma mark Actions
- (IBAction)add:(id)sender {
	
	[self addNewItem];
}
@end
