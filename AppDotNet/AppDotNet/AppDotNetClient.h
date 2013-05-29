//
//  AppDotNetClient.h
//  AppDotNet
//
//  Created by keith Alperin on 5/16/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDotNetClient : NSObject
-(void)publicTimelineWithCompletionHandler:(void (^)(NSArray *resultsDictionaries))completionHandler;
-(void)postsForUserWithID:(NSString *)idNumberString  completionHandler:(void (^)(NSArray *resultsDictionaries))completionHandler;

@end
