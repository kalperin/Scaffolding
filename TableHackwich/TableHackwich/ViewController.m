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
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.items = [NSMutableArray array];
	
}


-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.items.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *reuseIdentifier = @"cellReuseIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	}
	
	cell.textLabel.text = self.items[indexPath.row];
	
	return cell;
}
- (IBAction)add:(id)sender {
	[self.items addObject:self.textField.text];
	
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.items.count - 1 inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	self.textField.text = nil;
}
@end
