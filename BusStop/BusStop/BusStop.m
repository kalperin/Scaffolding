//
//  BusStop.m
//  BusStop
//
//  Created by keith Alperin on 5/21/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "BusStop.h"

@interface BusStop ()
@property(nonatomic,assign) CLLocationCoordinate2D coordinate;
@property(nonatomic,copy) NSString* title;
@property(nonatomic,copy) NSString* subtitle;

@property(nonatomic,strong) NSString* direction;
@property(nonatomic,strong) NSString* routes;
@property(nonatomic,strong) NSString* transfer;


@end

@implementation BusStop
- (id)initWithLatitude:(CLLocationDegrees) latitude longitude:(CLLocationDegrees)longitude name:(NSString *)name direction:(NSString *)direction routes:(NSString *)routes transfer:(NSString *)transfer
{
    self = [super init];
    if (self) {
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
		self.title = name;
		self.direction = direction;
		self.routes = routes;
		self.transfer = transfer;
    }
    return self;
}
@end
