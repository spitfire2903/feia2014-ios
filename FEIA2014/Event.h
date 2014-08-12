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
    EVENT_CATEGORY_MUSIC = 0,
    EVENT_CATEGORY_DANCING,
    EVENT_CATEGORY_VISUAL_ARTS,
    EVENT_CATEGORY_PERFORMING_ARTS,
    EVENT_CATEGORY_MEDIALOGY
} EventCategory;

@interface Event : NSObject

@end
