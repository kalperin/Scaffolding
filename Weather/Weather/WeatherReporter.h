//
//  WeatherReporter.h
//  Weather
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Helium Foot Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherReporter : NSObject
{
	NSString *__cityName;
	
}
-(void)reportWeather:(NSString*)cityName temperature:(NSString*)temperature;

@end
