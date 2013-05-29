//
//  WikipediaSearcher.h
//  Wikipedia
//
//  Created by keith Alperin on 5/15/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WikipediaSearcher : NSObject
-(void)searchWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *resultsDictionaries))completionHandler;
@end
