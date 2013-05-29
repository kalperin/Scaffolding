//
//  ViewController.m
//  MapViewHackwich
//
//  Created by keith Alperin on 5/19/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "AcademyLocation.h"
#import "MobileMakersAnnotationView.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	CLLocationCoordinate2D chicagoCenter = CLLocationCoordinate2DMake(41.90,-87.65);
	MKCoordinateSpan span = MKCoordinateSpanMake(0.2,0.2);
	self.mapView.region = MKCoordinateRegionMake(chicagoCenter, span);
	
	AcademyLocation *academyLocation = [[AcademyLocation alloc] init];
	academyLocation.title = @"Mobile Makers";
	academyLocation.coordinate = CLLocationCoordinate2DMake(41.894032,-87.634589);
	
	[self.mapView addAnnotation:academyLocation];
	
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	UIViewControlle	r *vc = [self.navigationController topViewController];
	
	[vc pre];
	
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation
{
	static NSString *reuseIdentifier = @"reuseIdentifier";
	MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
	if (annotationView == nil) {
		annotationView = [[MobileMakersAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
		annotationView.canShowCallout = YES;
		annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	} else {
		annotationView.annotation = annotation;
	}
	
	return annotationView;

}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	NSLog(@"%@ tapped", view.annotation.title);
}
@end
