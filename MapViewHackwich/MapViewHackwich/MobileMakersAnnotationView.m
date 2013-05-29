//
//  MobileMakersAnnotationView.m
//  MapViewHackwich
//
//  Created by keith Alperin on 5/20/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "MobileMakersAnnotationView.h"

@implementation MobileMakersAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.image = [UIImage imageNamed:@"mobilemakers"];
    }
    return self;
}



@end
