//
//  WeatherReporter.m
//  Weather
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Helium Foot Software. All rights reserved.
//

#import "WeatherReporter.h"

@implementation WeatherReporter

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


-(void)reportWeather:(NSString *)cityName temperature:(NSString *)temperature
{
	NSLog(@"the temperature is %@ in %@", temperature, cityName);
}
@end
