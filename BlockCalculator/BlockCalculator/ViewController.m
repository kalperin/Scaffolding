//
//  ViewController.m
//  BlockCalculator
//
//  Created by keith Alperin on 5/13/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

typedef CGFloat(^MathBlock)(NSInteger number0, NSInteger number1);


@interface ViewController ()
@property(nonatomic,assign)CGFloat currentTotal;
@property(nonatomic,assign)NSInteger number0;
@property(nonatomic,assign)NSInteger number1;
@property(nonatomic,strong)NSString* currentOperationString;
@property (nonatomic, copy) CGFloat (^addBlock)(NSInteger number0, NSInteger number1);
@property (nonatomic, copy) CGFloat (^subtractBlock)(NSInteger number0, NSInteger number1);
@property (nonatomic, copy) CGFloat (^multiplyBlock)(NSInteger number0, NSInteger number1);
@property (nonatomic, copy) CGFloat (^divideBlock)(NSInteger number0, NSInteger number1);

-(MathBlock)blockForOperationString:(NSString *)operationString;
-(void)updateDisplayedTotal;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	
	self.addBlock = ^(NSInteger number0, NSInteger number1) {
		return (CGFloat)(number0 + number1);
	};
	self.subtractBlock = ^(NSInteger number0, NSInteger number1) {
		return (CGFloat)(number0 - number1);
	};
	self.multiplyBlock = ^(NSInteger number0, NSInteger number1) {
		return (CGFloat)(number0 * number1);
	};
	self.divideBlock = ^(NSInteger number0, NSInteger number1) {
		CGFloat result = 0.0;
		if (number1 == 0.0) {
			result = (CGFloat)NSNotFound;
		} else {
			result = ((CGFloat)number0/(CGFloat)number1);
		}
		return result;
	};
	
	[self clearWithButton:nil];
}

-(MathBlock)blockForOperationString:(NSString *)operationString
{
	if ([operationString isEqualToString:@"÷"]) {
		return self.divideBlock;
	} else if ([operationString isEqualToString:@"-"]) {
		return self.subtractBlock;
	} else if ([operationString isEqualToString:@"x"]) {
		return self.multiplyBlock;
	} else {
		return self.addBlock;
	}
}

-(void)updateDisplayedTotal
{
	MathBlock mathBlock = [self blockForOperationString:self.currentOperationString];
	CGFloat total = mathBlock(self.number0, self.number1);
	self.totalLabel.text = [NSString stringWithFormat:@"%0.2f", total];
}

#pragma mark actions, yo
- (IBAction)enterNumberWithButton:(id)sender {
	if (self.currentOperationString.length == 0) {
		self.number0 = [[NSString stringWithFormat:@"%i%i", self.number0,[[sender titleForState:UIControlStateNormal] integerValue]] integerValue];
		self.number0label.text = [NSString stringWithFormat:@"%i",self.number0];
	} else {
		self.number1 = [[NSString stringWithFormat:@"%i%i", self.number1,[[sender titleForState:UIControlStateNormal] integerValue]] integerValue];
		self.number1Label.text = [NSString stringWithFormat:@"%i",self.number1];
	}
}
- (IBAction)enterOperationWithButton:(id)sender {
	self.currentOperationString = [sender titleForState:UIControlStateNormal];
	self.operationLabel.text = self.currentOperationString;
}

- (IBAction)equalsWithButton:(id)sender {
	[self updateDisplayedTotal];
}

- (IBAction)clearWithButton:(id)sender {
	self.number0label.text = nil;
	self.number1Label.text = nil;
	self.totalLabel.text = nil;
	self.currentOperationString = nil;
	self.operationLabel.text = nil;
	self.number0 = 0;
	self.number1 = 0;
	
	
}
@end
