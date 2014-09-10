//
//  MapViewController.h
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "BaseViewController.h"
#import <MapKit/MapKit.h>
#import "DisplayMap.h"

@class DisplayMap;

@interface MapViewController : BaseViewController<CLLocationManagerDelegate,UITextFieldDelegate,MKMapViewDelegate>

@property (nonatomic,retain) CLLocationManager *locationManager;

@property (nonatomic,retain) CLLocation *currentLocation;

@property NSMutableArray* pinLocations;


@end
