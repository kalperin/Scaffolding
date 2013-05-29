//
//  BusStop.h
//  MapViewHackwich
//
//  Created by keith Alperin on 5/20/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AcademyLocation : NSObject <MKAnnotation>
@property(nonatomic,assign) CLLocationCoordinate2D coordinate;
@property(nonatomic,strong) NSString* title;
@property(nonatomic,strong) NSString* subTitle;
@end
