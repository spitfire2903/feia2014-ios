//
//  EventManager.h
//  FEIA2014
//
//  Created by MC1 on 8/25/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "Place.h"
#import "Partners.h"
#import "NSDate+FEIA.h"
#import <ObjectiveSugar/ObjectiveSugar.h>
#import "MyEvent.h"
#import "AppDelegate.h"

@interface EventManager : NSObject

+(EventManager *) sharedDatabase;

-(NSArray *) events;
-(NSDictionary *)eventsIdDict;
-(NSDictionary *)eventsDict;

-(NSArray *)myEvents;
-(NSDictionary *)myEventsDict;

-(BOOL)isEventFavorited:(NSNumber*)eventId;

-(NSArray*)eventByType:(EventType)type andCategory:(EventCategory)category;
//-(NSArray *) calendarEvents;
/*
-(void) swapOutlawsAtIndex:(NSInteger)firstIndex otherIndex:(NSInteger)secondIndex;

-(void) removeOutlawAtIndex:(NSInteger)index;

-(void)removeOutlaw:(Outlaw*)outlaw;

-(void) addOutlaw:(Outlaw *)outlaw;
*/
@end
