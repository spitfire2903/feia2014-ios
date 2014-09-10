//
//  MapViewController.m
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

@synthesize pinLocations;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    
    pinLocations = [[NSMutableArray alloc] init];
    
    [self putPin:@"Cantinho do Acarajé" andCoordinates:CLLocationCoordinate2DMake(-22.8207577, -47.0882342)];
    [self putPin:@"Cantina do Gatti" andCoordinates:CLLocationCoordinate2DMake(-22.81502282, -47.06411541)];
    [self putPin:@"Borda Brasil" andCoordinates:CLLocationCoordinate2DMake(-22.8222011, -47.0923427)];
    
    [self zoomToFitMapAnnotations:self.mapView];
    
}

- (void)zoomToFitMapAnnotations:(MKMapView *)mapView {
    if ([mapView.annotations count] == 0) return;
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in mapView.annotations) {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    
    // Add a little extra space on the sides
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.1;
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.1;
    
    region = [mapView regionThatFits:region];
    [mapView setRegion:region animated:YES];
}

-(void)putPin:(NSString*)locationName andCoordinates:(CLLocationCoordinate2D)coordinate{
    DisplayMap *ann = [[DisplayMap alloc] initWithCoordinate:coordinate];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    ann.title = locationName;
    
    //    [geocoder reverseGeocodeLocation:self.currentLocation completionHandler:
    //     ^(NSArray *placemarks, NSError *error) {
    //         //Get nearby address
    //         CLPlacemark *placemark = [placemarks objectAtIndex:0];
    //
    //         ann.subtitle = placemark.locality;
    //
    //         [pinLocations addObject:ann];
    //
    //         [self.map addAnnotation:ann];
    //    }];
    
    [pinLocations addObject:ann];
    
    [self.mapView addAnnotation:ann];
}
/*
- (void)putPin:(NSString*)locationName {
    DisplayMap *ann = [[DisplayMap alloc] initWithCoordinate:self.currentLocation.coordinate];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    ann.title = locationName;
    
    //    [geocoder reverseGeocodeLocation:self.currentLocation completionHandler:
    //     ^(NSArray *placemarks, NSError *error) {
    //         //Get nearby address
    //         CLPlacemark *placemark = [placemarks objectAtIndex:0];
    //
    //         ann.subtitle = placemark.locality;
    //
    //         [pinLocations addObject:ann];
    //
    //         [self.map addAnnotation:ann];
    //    }];
    
    [pinLocations addObject:ann];
    
    [self.mapView addAnnotation:ann];
    
}
*/
/*
#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textfield{
    [textfield resignFirstResponder];
    
    [self putPin:textfield.text];
    
    return YES;
}
*/
#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    self.currentLocation = userLocation;
    
    [mapView setRegion:MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 1000, 1000) animated:YES];
}

@end
