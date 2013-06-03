//
//  ViewController.m
//  Weather
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Helium Foot Software. All rights reserved.
//

#import "ViewController.h"
#import "WeatherReporter.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	WeatherReporter* keithsWeatherReporter = [[WeatherReporter alloc] init];
	[keithsWeatherReporter reportWeather:@"Chicago" temperature:@"69º"];

	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
