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

-(UIImage*)getIcon{
    UIImage* icon = nil;
    
    switch (self.category) {
        case EVENT_CATEGORY_DANCING:
            icon = [UIImage imageNamed:@"ic_dancing_small"];
            
            break;
        case EVENT_CATEGORY_MUSIC:
            icon = [UIImage imageNamed:@"ic_music_small"];

            break;
        case EVENT_CATEGORY_VISUAL_ARTS:
            icon = [UIImage imageNamed:@"ic_visual_arts_small"];

            break;
        case EVENT_CATEGORY_PERFORMING_ARTS:
            icon = [UIImage imageNamed:@"ic_performing_arts_small"];

            break;
        case EVENT_CATEGORY_MEDIALOGY:
            icon = [UIImage imageNamed:@"ic_medialogy_small"];

            break;
        case EVENT_CATEGORY_GENERAL:
            icon = [UIImage imageNamed:@"ic_credits_small"];
            
            break;
    }
    
    return icon;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@ %@ %@", self.name, [self getDateString], [self getTimeString]];
}

-(NSString*)getDateString{
    NSString* date = nil;
    NSDateFormatter* formatter = nil;
    
    if(self.date){
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd/MM"];
        
        date = [formatter stringFromDate:self.date];
    }
    
    return date;
}

-(NSString*)getTimeString{
    NSString* time = nil;
    NSDateFormatter* formatter = nil;
    
    if(self.date){
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm"];
        
        time = [formatter stringFromDate:self.date];
    }
    
    return time;
}

-(void)setDateWithString:(NSString*)date{
    NSDateFormatter* formatter = nil;
    NSDate* eventDate = nil;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    
    eventDate = [formatter dateFromString:date];
    
    self.date = eventDate;
}

+(Event*)eventWithId:(int)eventId andName:(NSString*)name andDate:(NSDate*)date andDescription:(NSString*)description andType:(EventType)type andCategory:(EventCategory)category{
    Event* event = nil;
    
    event = [[Event alloc] init];
    
    [event setEventId:[NSNumber numberWithInt:eventId]];
    [event setAuthor:@"José Ubaldo da Silva Sauro"];
    [event setName:name];
    [event setDate:date];
    [event setShortDescription:description];
    [event setCategory:category];
    [event setType:type];
    
    return event;
}

@end
