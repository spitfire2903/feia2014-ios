//
//  DisplayMap.m
//  FEIA2014
//
//  Created by MC1 on 9/10/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "DisplayMap.h"
#import <MapKit/MapKit.h>

@implementation DisplayMap

@synthesize coordinate,title,subtitle;

- (id) initWithCoordinate:(CLLocationCoordinate2D)initCoordinate{
    self = [super init];
    
    if(self != nil){
        coordinate = initCoordinate;
    }
    
    return self;
}

@end
