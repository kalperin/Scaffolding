//
//  Overlay.m
//  BusStop
//
//  Created by keith Alperin on 5/21/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "Overlay.h"

@interface Overlay ()
@property (nonatomic, assign) MKMapRect boundingMapRect;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end

@implementation Overlay
- (id)initWithBoundingRect:(MKMapRect)boundingRect coordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        self.coordinate = coordinate;
		self.boundingMapRect = boundingRect;
    }
    return self;
}

- (BOOL)intersectsMapRect:(MKMapRect)mapRect
{
	return MKMapRectIntersectsRect(mapRect, self.boundingMapRect);
}
@end
