//
//  ViewController.m
//  EvensAndOdds
//
//  Created by keith Alperin on 5/13/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic, copy) FilterBlock all;
@property (nonatomic, copy) FilterBlock evens;
@property (nonatomic, copy) FilterBlock odds;


-(void)populateNumbers;
-(void)filterNumbers;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self populateNumbers];
	
	self.all = ^(NSNumber *number) {
		return YES;
	};
	self.evens = ^(NSNumber *number) {
		BOOL isEven = ([number integerValue] % 2) == 0;
		return isEven;
	};
	self.odds = ^(NSNumber *number) {
		BOOL isOdd = ([number integerValue] % 2) == 1;
		return isOdd;
	};
	
	if (self.filter == nil) {
		self.filter = self.all;
	}
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self filterNumbers];
	
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([sender isEqual:self.evenButton]) {
		[segue.destinationViewController setFilter:self.evens];
	} else {
		[segue.destinationViewController setFilter:self.odds];
	}
	[segue.destinationViewController setNumbers:self.numbers];

}
-(void)populateNumbers
{
	if (self.numbers == nil) {
		self.numbers = [NSMutableArray array];
		for (NSInteger i=0; i<50; i++) {
			NSInteger number = arc4random() % INT_MAX;
			[self.numbers addObject:[NSNumber numberWithInteger:number]];
		}
	}
}

-(void)filterNumbers
{
	NSMutableArray *newNumbers = [NSMutableArray array];
	for (NSNumber *number in self.numbers) {
		if (self.filter(number)) {
			[newNumbers addObject:number];
		}
	}
	self.numbers = newNumbers;
}

#pragma mark table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.numbers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *reuseIdentifier = @"cellReuseIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	}
	
	cell.textLabel.text = [NSString stringWithFormat:@"%@", self.numbers[indexPath.row]];
	
	return cell;

}


@end
