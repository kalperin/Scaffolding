//
//  ViewController.m
//  MMPersistanceScaffold
//
//  Created by Don Bora on 6/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITableView *oTableView;
    NSArray* people;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobilemakers.co/api/members.json"]];
    
    [super viewDidLoad];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* error)
     {
         people = (NSArray*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
         [oTableView reloadData];
     }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UITableViewDataSouce

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [people count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* tableViewCell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Person" forIndexPath:indexPath];
    
    tableViewCell.textLabel.text = [((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"name"];
    tableViewCell.detailTextLabel.text = [((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"email"];
    tableViewCell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"avatar_url"]]]];
    return tableViewCell;
}


@end
