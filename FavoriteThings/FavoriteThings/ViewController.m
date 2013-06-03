//
//  ViewController.m
//  FavoriteThings
//
//  Created by keith Alperin on 5/5/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

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

	NSMutableString *formattedFavoriteThings = [NSMutableString stringWithString:@""];
	for (NSString* favoriteThing in self.favoriteThings) {
		[formattedFavoriteThings appendFormat:@"%@\n", favoriteThing];
		
	}
	self.textView.text = formattedFavoriteThings;
	
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
	self.favoriteThings = [NSMutableArray arrayWithArray:[[self.favoriteThings reverseObjectEnumerator] allObjects]];
	
	
//	NSMutableArray *newFavoriteThings = [NSMutableArray array];
//	
//	for (NSInteger i=(self.favoriteThings.count - 1); i>=0; i--) {
//		[newFavoriteThings addObject:[self.favoriteThings objectAtIndex:i]];
//	}
//	self.favoriteThings = newFavoriteThings;
//	
	[self updateDisplayedFavoriteThings];
}
@end
