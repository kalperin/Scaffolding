//
//  AppDotNetClient.m
//  AppDotNet
//
//  Created by keith Alperin on 5/16/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "AppDotNetClient.h"

@interface AppDotNetClient ()
-(void)requestPostsWithURL:(NSURL *)url  completionHandler:(void (^)(NSArray *resultsDictionaries))completionHandler;
@end

@implementation AppDotNetClient

-(void)publicTimelineWithCompletionHandler:(void (^)(NSArray *resultsDictionaries))completionHandler
{
	NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
	[self requestPostsWithURL:url completionHandler:completionHandler];
}

-(void)postsForUserWithID:(NSString *)idNumberString  completionHandler:(void (^)(NSArray *resultsDictionaries))completionHandler
{
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://alpha-api.app.net/stream/0/users/%@/posts", idNumberString]];
	[self requestPostsWithURL:url completionHandler:completionHandler];
	
}

-(void)requestPostsWithURL:(NSURL *)url  completionHandler:(void (^)(NSArray *resultsDictionaries))completionHandler
{
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	[NSURLConnection sendAsynchronousRequest:request
									   queue:[NSOperationQueue mainQueue]
						   completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
							   NSError *jsonError = nil;
							   NSDictionary *responsDictionary = [NSJSONSerialization JSONObjectWithData:responseData
																								 options:0
																								   error:&jsonError];
							   
							   NSArray *responseArray = responsDictionary[@"data"];
							   
							   completionHandler(responseArray);
						   }];

}
@end
