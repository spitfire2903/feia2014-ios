//
//  Event.h
//  FEIA2014
//
//  Created by Ricardo Nunes de Miranda on 12/08/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Place.h"

typedef enum {
    EVENT_TYPE_WORKSHOP = 0,
    EVENT_TYPE_EXHIBITION,
    EVENT_TYPE_PARTY
} EventType;

typedef enum {
    EVENT_CATEGORY_DANCING = 0,
    EVENT_CATEGORY_MUSIC,
    EVENT_CATEGORY_VISUAL_ARTS,
    EVENT_CATEGORY_PERFORMING_ARTS,
    EVENT_CATEGORY_MEDIALOGY,
    EVENT_CATEGORY_GENERAL
} EventCategory;

@interface Event : NSObject

@property (nonatomic) NSNumber* eventId;
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* author;
@property (nonatomic) EventType type;
@property (nonatomic) EventCategory category;
@property (nonatomic) NSDate* date;
@property (nonatomic) NSString* shortDescription;
@property (nonatomic) Place* place;
@property (nonatomic) NSString* placeData;
@property (nonatomic) NSString* site;

-(UIImage*)getIcon;
-(NSString*)getDateString;
-(NSString*)getTimeString;
-(void)setDateWithString:(NSString*)date;

+(Event*)eventWithId:(int)eventId andName:(NSString*)name andDate:(NSDate*)date andDescription:(NSString*)description andType:(EventType)type andCategory:(EventCategory)category;

@end
