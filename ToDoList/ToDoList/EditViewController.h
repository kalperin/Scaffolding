//
//  EditViewController.h
//  FavoriteThingsTable
//
//  Created by keith Alperin on 5/7/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditingDelegate.h"

@interface EditViewController : UIViewController
@property(nonatomic,weak)id<EditingDelegate>editingDelegate;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property(nonatomic,strong) NSIndexPath* indexPath;
@property(nonatomic,strong) NSString* initialValue;

- (id)initWithEditingDelegate:(id<EditingDelegate>)editingDelegate indexPath:(NSIndexPath *)indexPath initialValue:(NSString *)initialValue;

- (IBAction)completeEditWithButton:(id)sender;
@end
