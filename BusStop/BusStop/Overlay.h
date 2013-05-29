//
//  Overlay.h
//  BusStop
//
//  Created by keith Alperin on 5/21/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Overlay : NSObject<MKOverlay>
- (id)initWithBoundingRect:(MKMapRect)boundingRect coordinate:(CLLocationCoordinate2D)coordinate;


@end
