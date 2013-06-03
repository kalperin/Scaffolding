//
//  ViewController.m
//  CustomTableViewCell
//
//  Created by keith Alperin on 5/29/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "SwitchCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return <#expression#>
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return <#expression#>
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SwitchCell *switchCell = [tableView dequeueReusableCellWithIdentifier:@"SwitchCell"];
	[switchCell.onOffSwitch setSelected:YES];
	return switchCell;
}


@end
