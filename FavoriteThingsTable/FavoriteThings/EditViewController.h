//
//  EditViewController.h
//  FavoriteThingsTable
//
//  Created by keith Alperin on 5/7/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteThingsEditingDelegate.h"

@interface EditViewController : UIViewController
@property(nonatomic,weak)id<FavoriteThingsEditingDelegate>favoriteThingsEditingDelegate;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property(nonatomic,strong) NSIndexPath* indexPath;
@property(nonatomic,strong) NSString* initialValue;

- (id)initWithFavoriteThingsEditingDelegate:(id<FavoriteThingsEditingDelegate>)favoriteThingsEditingDelegate indexPath:(NSIndexPath *)indexPath initialValue:(NSString *)initialValue;

- (IBAction)completeEditWithButton:(id)sender;
@end
