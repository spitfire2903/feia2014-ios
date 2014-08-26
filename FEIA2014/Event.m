//
//  Event.m
//  FEIA2014
//
//  Created by Ricardo Nunes de Miranda on 12/08/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "Event.h"

@interface Event()

@end


@implementation Event

+(Event*)eventWithName:(NSString*)name andDate:(NSDate*)date andDescription:(NSString*)description andType:(EventType)type andCategory:(EventCategory)category{
    Event* event = nil;
    
    event = [[Event alloc] init];
    
    [event setName:name];
    [event setDate:date];
    [event setShortDescription:description];
    [event setCategory:category];
    [event setType:type];
    
    return event;
}

@end
