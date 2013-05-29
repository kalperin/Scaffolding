//
//  BusStop.h
//  BusStop
//
//  Created by keith Alperin on 5/21/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BusStop : NSObject<MKAnnotation>
@property(nonatomic,strong, readonly) NSString* direction;
@property(nonatomic,strong, readonly) NSString* routes;
@property(nonatomic,strong, readonly) NSString* transfer;

- (id)initWithLatitude:(CLLocationDegrees) latitude longitude:(CLLocationDegrees)longitude name:(NSString *)name direction:(NSString *)direction routes:(NSString *)routes transfer:(NSString *)transfer;

@end
