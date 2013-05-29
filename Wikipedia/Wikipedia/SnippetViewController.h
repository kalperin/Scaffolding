//
//  SnippetViewController.h
//  Wikipedia
//
//  Created by keith Alperin on 5/15/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnippetViewController : UIViewController
@property(nonatomic,strong) NSString* articleTitle;
@property(nonatomic,strong) NSString* snippet;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end
