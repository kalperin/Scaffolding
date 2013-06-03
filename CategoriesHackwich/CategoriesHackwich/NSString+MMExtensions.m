//
//  NSString+MMExtensions.m
//  CategoriesHackwich
//
//  Created by keith Alperin on 5/29/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "NSString+MMExtensions.h"

@implementation NSString (MMExtensions)


-(NSString*)mmReversedString
{
	NSMutableArray *reversedArray = [NSMutableArray arrayWithCapacity:self.length];
	for (NSInteger i=self.length-1;i>=0;i--) {
		NSRange range = NSMakeRange(i, 1);
		NSString *letter = [self substringWithRange:range];
		[reversedArray addObject:letter];
	}
	NSString *reversedString = [reversedArray componentsJoinedByString:@""];
	return reversedString;
}
@end
