//
//  EditingDelegate.h
//  ToDoList
//
//  Created by keith Alperin on 5/7/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EditingDelegate <NSObject>
-(void)updateItemAtIndexPath:(NSIndexPath*)indexPath toValue:(NSString *)value;
@end
