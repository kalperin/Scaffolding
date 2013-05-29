//
//  EditViewController.m
//  FavoriteThingsTable
//
//  Created by keith Alperin on 5/7/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (id)initWithFavoriteThingsEditingDelegate:(id<FavoriteThingsEditingDelegate>)favoriteThingsEditingDelegate indexPath:(NSIndexPath *)indexPath initialValue:(NSString *)initialValue
{
    self = [super initWithNibName:@"EditViewController" bundle:nil];
    if (self) {
        self.favoriteThingsEditingDelegate = favoriteThingsEditingDelegate;
		self.indexPath = indexPath;
		self.initialValue = initialValue;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	self.textField.text = self.initialValue;
}

- (IBAction)completeEditWithButton:(id)sender
{
	[self.favoriteThingsEditingDelegate updateItemAtIndexPath:self.indexPath toValue:self.textField.text];
}
@end
