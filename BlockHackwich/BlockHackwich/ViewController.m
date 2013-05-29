//
//  ViewController.m
//  BlockHackwich
//
//  Created by keith Alperin on 5/13/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

typedef NSInteger (^mathType)(NSInteger intOne, NSInteger intTwo);


@interface ViewController ()
-(NSInteger) calculateNumber:(NSInteger)intOne toNumber:(NSInteger)intTwo withBlock:(mathType)mathBlock;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)calcualateNumbers:(id)sender
{
	

//	mathType add = ^(NSInteger intOne, NSInteger intTwo){
//		return intOne + intTwo;
//	};
//	mathType subtract = ^(NSInteger intOne, NSInteger intTwo){
//		return intOne - intTwo;
//	};
//
//	mathType mathBlock = nil;
//	if ([sender isEqual:self.addButton]) {
//		mathBlock = add;
//	} else {
//		mathBlock = subtract;
//	}
//
//	NSInteger newNumber = [self calculateNumber:self.firstNumber.text.integerValue toNumber:self.secondNumber.text.integerValue withBlock:mathBlock];
//
	
	
	
	
	NSInteger newNumber = [self calculateNumber:self.firstNumber.text.integerValue toNumber:self.secondNumber.text.integerValue withBlock:^NSInteger(NSInteger intOne, NSInteger intTwo) {
		return intOne + intTwo;
	}];
						   
    self.result.text = [NSString stringWithFormat:@"%i", newNumber];
}



-(NSInteger) calculateNumber:(NSInteger)intOne toNumber:(NSInteger)intTwo
{
	NSInteger (^add)(NSInteger, NSInteger) = ^(NSInteger intOne, NSInteger intTwo){
		return intOne + intTwo;
	};
	
	NSInteger newNumber = add(intOne, intTwo);
	return newNumber;
}

-(NSInteger) calculateNumber:(NSInteger)intOne toNumber:(NSInteger)intTwo withBlock:(mathType)mathBlock
{
	NSInteger (^addBlock)(NSInteger, NSInteger) = ^(NSInteger intOne, NSInteger intTwo){
		return intOne + intTwo;
	};
	
	NSInteger newNumber = addBlock(intOne, intTwo);
	return newNumber;
}

@end
