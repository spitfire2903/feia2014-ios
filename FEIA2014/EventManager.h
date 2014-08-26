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

@interface EventManager : NSObject

+(EventManager *) sharedDatabase;

-(NSArray *) events;

//-(NSArray *) calendarEvents;
/*
-(void) swapOutlawsAtIndex:(NSInteger)firstIndex otherIndex:(NSInteger)secondIndex;

-(void) removeOutlawAtIndex:(NSInteger)index;

-(void)removeOutlaw:(Outlaw*)outlaw;

-(void) addOutlaw:(Outlaw *)outlaw;
*/
@end
