//
//  WikipediaSearcher.m
//  Wikipedia
//
//  Created by keith Alperin on 5/15/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "WikipediaSearcher.h"

@implementation WikipediaSearcher
-(void)searchWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *resultsDictionaries))completionHandler
{
	NSString *urlString = [NSString stringWithFormat:@"https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=%@&srprop=snippet&format=json", searchTerm];
	NSURL *url = [NSURL URLWithString:urlString];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	[NSURLConnection sendAsynchronousRequest:request
									   queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
							   NSError *jsonError = nil;
							   NSDictionary *responsDictionary = [NSJSONSerialization JSONObjectWithData:responseData
																								 options:0
																								   error:&jsonError];
							   
							   NSArray *responseArray = responsDictionary[@"query"][@"search"];
							   
							   completionHandler(responseArray);
						   }];

}
@end
