//
//  ViewController.m
//  BusStop
//
//  Created by keith Alperin on 5/21/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "MapViewController.h"
#import "BusStop.h"
#import "Overlay.h"

@interface MapViewController ()
@property(nonatomic,strong) NSMutableArray* busStops;
-(void)loadBusStops;
@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	CLLocationCoordinate2D chicagoCenter = CLLocationCoordinate2DMake(41.90,-87.65);
	MKCoordinateSpan span = MKCoordinateSpanMake(0.2,0.2);
	self.mapView.region = MKCoordinateRegionMake(chicagoCenter, span);
	

	
	[self loadBusStops];
}


-(void)loadBusStops
{
	CLLocationCoordinate2D  points[4];
	points[0] = CLLocationCoordinate2DMake(41.885793230308465, -87.6339054107666);
	points[1] = CLLocationCoordinate2DMake(41.885793230308465, -87.62622356414795);
	points[2] = CLLocationCoordinate2DMake(41.87668697630679, -87.62622356414795);
	points[3] = CLLocationCoordinate2DMake(41.87668697630679, -87.6339054107666);
	
	MKPolygon* loopPolygon = [MKPolygon polygonWithCoordinates:points count:4];
	[self.mapView addOverlay:loopPolygon];

	
//	NSURL *url = [NSURL URLWithString:@"http://www.heliumfoot.com/files/mobilemakers/bus.json"];
//	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
//	[NSURLConnection sendAsynchronousRequest:request
//									   queue:[NSOperationQueue mainQueue]
//						   completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
//							   NSError *jsonError = nil;
//							   NSDictionary *responsDictionary = [NSJSONSerialization JSONObjectWithData:responseData
//																								 options:0
//																								   error:&jsonError];
//							   
//							   NSArray *responseArray = responsDictionary[@"row"];
//							   self.busStops = [NSMutableArray arrayWithCapacity:responseArray.count];
//							   for (NSDictionary *dictionary in responseArray) {
//								   BusStop *busStop = [[BusStop alloc] initWithLatitude:<#(CLLocationDegrees)#> longitude:<#(CLLocationDegrees)#> name:<#(NSString *)#> direction:<#(NSString *)#> routes:<#(NSString *)#> transfer:<#(NSString *)#>]
//							   }
//							   
//							   
//							   
//						   }];

}


- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id < MKOverlay >)overlay
{
	MKPolygonView*  overlayView = [[MKPolygonView alloc] initWithPolygon:(MKPolygon*)overlay] ;
	
	overlayView.strokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.75];
	overlayView.fillColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.25];
	overlayView.lineWidth = 2;
	
	return overlayView;
}
@end
