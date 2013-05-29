//
//  SnippetViewController.m
//  Wikipedia
//
//  Created by keith Alperin on 5/15/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "SnippetViewController.h"

@interface SnippetViewController ()

@end

@implementation SnippetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	self.textView.text = self.snippet;
}


@end
