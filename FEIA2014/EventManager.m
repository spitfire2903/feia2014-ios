//
//  EventManager.m
//  FEIA2014
//
//  Created by MC1 on 8/25/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "EventManager.h"

static NSString* const CALENDAR_ENTITY = @"MyEvent";
static NSString* const EVENT_ENTITY = @"EventDB";
/*static NSString* const EVENT_ID_PROPERTY = @"eventId";
static NSString* const EVENT_CATEGORY_PROPERTY = @"category";
static NSString* const EVENT_TYPE_PROPERTY = @"type";
*/
@interface EventManager()

@property (strong,nonatomic) NSMutableArray *eventList;
@property (strong,nonatomic) NSMutableArray *myEventList;

@end

@implementation EventManager

static EventManager *_eventManager = nil;


#pragma mark - Initialization Methods

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [EventManager sharedDatabase];
}

-(id)init
{
    self = [super init];
    
    if (self){
        self.eventList = [[NSMutableArray alloc] init];
        self.myEventList = [[NSMutableArray alloc] init];
        
        [self baseInit];
    }
    
    return self;
}

#pragma mark - Singleton methods

+(EventManager *)sharedDatabase
{
    if (!_eventManager) {
        _eventManager = [[super allocWithZone:nil] init];
        
        
    }
    
    return _eventManager;
}

#pragma mark - Public methods

-(NSArray *)events
{
    /*
    NSPredicate* predicate = nil;
    
    predicate = [NSPredicate predicateWithFormat:@"%@ = %@ OR %@ = %@", EVENT_TYPE_PROPERTY, EVENT_TYPE_EXHIBITION, EVENT_TYPE_PROPERTY, EVENT_TYPE_WORKSHOP];
    */
    return [self.eventList copy];
}

-(NSArray*)eventByType:(EventType)type{
    NSArray* result = nil;
    NSPredicate* predicate = nil;
    
    predicate = [NSPredicate predicateWithFormat:@"type = %d", type];
    
    result = [[self events] filteredArrayUsingPredicate:predicate];
    
    return result;
}


-(NSArray*)eventByType:(EventType)type andCategory:(EventCategory)category{
    NSArray* result = nil;
    NSPredicate* predicate = nil;
    
    predicate = [NSPredicate predicateWithFormat:@"category = %d AND type = %d", category, type];
    
    result = [[self events] filteredArrayUsingPredicate:predicate];
    
    return result;
}

-(NSDictionary *)eventsIdDict
{
    NSMutableDictionary* dict = nil;
    NSArray* events = nil;
   
    dict = [[NSMutableDictionary alloc] init];
    events = [self events];
    
    for (Event* event in events) {
        [dict setObject:event forKey:event.eventId];
    }
    
    return dict;
}

-(NSDictionary *)eventsDict
{
    NSMutableDictionary* dict = nil;
    NSArray* events = nil;
    NSDateFormatter* formatter = nil;
    NSDictionary* datesByIndexes = nil;
    NSDictionary* indexesByDates = nil;
    NSString* date = nil;
    NSNumber* dictIndex = nil;
  
    datesByIndexes = [EventManager eventDatesByIndex];
    indexesByDates = [EventManager indexByEventDates];
    
    events = [self events];
    formatter = [[NSDateFormatter alloc] init];
    dict = [[NSMutableDictionary alloc] init];
    
    [formatter setDateFormat:@"dd/MM/yyyy"];
    
    // Itera pelo numero de dias do feia e cria uma lista para cada
    for(int i = 0; i < 8; i++){
        [dict setObject:[NSMutableArray new] forKey:[NSNumber numberWithInt:i]];
    }
    
    for (Event* event in events) {
        date = [formatter stringFromDate:event.date];
        dictIndex = [indexesByDates objectForKey:date];
        [((NSMutableArray*)[dict objectForKey:dictIndex]) addObject:event];
    }
    
    return dict;
}

-(BOOL)isEventFavorited:(NSNumber*)eventId{
    NSArray* myEvents = nil;
    NSPredicate* predicate = nil;
    NSError *error = nil;
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:CALENDAR_ENTITY inManagedObjectContext:context ];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    predicate = [NSPredicate predicateWithFormat:@"eventId = %d", [eventId intValue]];//@"%@ = %d", EVENT_ID_PROPERTY, [eventId intValue]];
    
    [request setEntity:entityDescription];
    [request setPredicate:predicate];

    myEvents = [context executeFetchRequest:request error:&error];
    
    return ([myEvents count] > 0);
}

-(NSArray *)myEvents
{
    NSMutableArray* events = nil;
    NSArray* myEvents = nil;
    Event* event = nil;
    NSDictionary* eventsIdDict = nil;
    
    eventsIdDict = [self eventsIdDict];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:CALENDAR_ENTITY inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDescription];
    
    NSError *error;
    
    events = [[NSMutableArray alloc] init];
    myEvents = [context executeFetchRequest:request error:&error];

    for (MyEvent* myEvent in myEvents) {
        event = [eventsIdDict objectForKey:myEvent.eventId];
        
        [events addObject:event];
    }
    
    return events;
}

-(NSDictionary *)myEventsDict
{
    NSMutableDictionary* dict = nil;
    NSArray* events = nil;
    NSDateFormatter* formatter = nil;
    NSDictionary* datesByIndexes = nil;
    NSDictionary* indexesByDates = nil;
    NSString* date = nil;
    NSNumber* dictIndex = nil;
    
    datesByIndexes = [EventManager eventDatesByIndex];
    indexesByDates = [EventManager indexByEventDates];
    
    formatter = [[NSDateFormatter alloc] init];
    dict = [[NSMutableDictionary alloc] init];
    
    [formatter setDateFormat:@"dd/MM/yyyy"];
    
    // Itera pelo numero de dias do feia e cria uma lista para cada
    for(int i = 0; i < 8; i++){
        [dict setObject:[NSMutableArray new] forKey:[NSNumber numberWithInt:i]];
    }
    
    events = [self myEvents];
    
    for (Event* event in events) {
        date = [formatter stringFromDate:event.date];
        dictIndex = [indexesByDates objectForKey:date];
        [((NSMutableArray*)[dict objectForKey:dictIndex]) addObject:event];
    }

    return dict;
}


#pragma mark - Private methods

-(void) baseInit{
//    NSString* name = nil;
//    NSString* description = nil;
    NSSortDescriptor* descriptor = nil;
    NSArray* events = nil;
    NSMutableArray* jsonEvents = nil;
    NSError *error = nil;
    AppDelegate *appDelegate = nil;
    NSManagedObjectContext *context = nil;
    NSEntityDescription *entityDescription = nil;
    NSFetchRequest *request = nil;
    NSManagedObject *newEvent = nil;
    NSString* fileContents = nil;
    NSDictionary* jsonDict = nil;
    NSData* data = nil;
    
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    
    entityDescription = [NSEntityDescription entityForName:EVENT_ENTITY inManagedObjectContext:context ];
    request = [[NSFetchRequest alloc] init];
    
    [request setEntity:entityDescription];
    
    events = [context executeFetchRequest:request error:&error];
    
    /* Delete event core data
    for (EventDB* e in events) {
        [context deleteObject:e];
    }

    [context save:&error];
    
    if(true){
     */
    if([events count] <= 0){
        fileContents = [[NSBundle mainBundle] pathForResource:@"eventsLatin" ofType:@"json"];
        
        jsonEvents = [[NSMutableArray alloc] init];
        
        fileContents = [NSString stringWithContentsOfFile:fileContents encoding:NSUTF8StringEncoding error:&error];
        data = [fileContents dataUsingEncoding:NSUTF8StringEncoding];
        //data = [data subdataWithRange:NSMakeRange(0, [data length] - 1)];
        jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        events = [jsonDict objectForKey:@"events"];
        
        //NSLog(@"Events: %@", events);
        
        for (NSObject* object in events) {
            Event* event = nil;
            
            event = [Event new];
            [event setEventId:[object valueForKey:@"eventId"]];
            [event setName:[object valueForKey:@"name"]];
            [event setDateArrayFromJson:[object valueForKey:@"date"]];
            [event setShortDescription:[object valueForKey:@"shortDescription"]];
            
            if([object valueForKey:@"author"]){
                [event setAuthor:[object valueForKey:@"author"]];
            }
            
            if([object valueForKey:@"duration"]){
                [event setDuration:[[object valueForKey:@"duration"] intValue]];
            }
            
            [event setPlaceData:[object valueForKey:@"placeData"]];
            [event setSite:[object valueForKey:@"site"]];
            [event setCategory:[[object valueForKey:@"category"] intValue]];
            [event setType:[[object valueForKey:@"type"] intValue]];
            
            [jsonEvents addObject:event];
            //NSLog(@">> %@",object);
        }

        // Save events in core data
        for (Event* event in jsonEvents) {
            newEvent = [event managedObjectFromEvent];
            
            [context save:&error];
        }
        
        [self.eventList addObjectsFromArray:jsonEvents];
    } else{
        for (EventDB* eventDB in events) {
            Event* event = [Event new];
            
            [event eventFromManagedObject:eventDB];
            
            [self.eventList addObject:event];
        }
        
        // Lista de Event <- EventDB ERRO
        //self.eventList = events;
    }
    /*
    __block int eventId = 0;
    [category each:^(id object) {
        //NSLog(@"Car: %@", object);
        int categoryIndex = [category indexOfObject:object];
        
       [@1 upto:4 do:^(NSInteger index) {
           
            NSString* name = [NSString stringWithFormat:@"Apresentação %@ %d", object, index];
            NSString* description = [NSString stringWithFormat:@"Apresentação Descrição %@ %d", object, index];
            NSDate* date = [NSDate randomDateInYearOfDate];
            
           [self.eventList addObject:[Event eventWithId:eventId andName:name andDate:date andDescription:description andType:EVENT_TYPE_EXHIBITION andCategory:categoryIndex]];
           
            eventId++;
           /*
            name = [NSString stringWithFormat:@"Oficina %@ %d", object, index];
            description = [NSString stringWithFormat:@"Oficina Descrição %@ %d", object, index];
            date = [NSDate randomDateInYearOfDate];
            
            [self.eventList addObject:[Event eventWithId:eventId andName:name andDate:date andDescription:description andType:EVENT_TYPE_WORKSHOP andCategory:categoryIndex]];
           
           eventId++;*//*
        }];
    }];
    *//*
    [@1 upto:8 do:^(NSInteger index) {
        
        NSString* name = [NSString stringWithFormat:@"Noites FEIA  %d", index];
        NSString* description = [NSString stringWithFormat:@"Noite FEIA Descrição %d", index];
        NSDate* date = [NSDate randomDateInYearOfDate];
        
        [self.eventList addObject:[Event eventWithId:eventId andName:name andDate:date andDescription:description andType:EVENT_TYPE_PARTY andCategory:0]];
        
        eventId++;
        /*
        name = [NSString stringWithFormat:@"Oficina Interdisciplinar %d", index];
        description = [NSString stringWithFormat:@"Oficina Descrição %d", index];
        date = [NSDate randomDateInYearOfDate];
        
        [self.eventList addObject:[Event eventWithId:eventId andName:name andDate:date andDescription:description andType:EVENT_TYPE_WORKSHOP andCategory:EVENT_CATEGORY_GENERAL]];
        
         eventId++;
         *//*
    }];
    */
    
    /*
    srandom(time(NULL));
    for (NSInteger x = 0; x < [self.eventList count]; x++) {
        NSInteger randInt = (random() % ([self.eventList count] - x)) + x;
        [self.eventList exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }*/
    
    descriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    [self.eventList sortUsingDescriptors:@[descriptor]];
    
}

+(NSDictionary*)eventDatesByIndex{
    NSDictionary* dates = nil;
    
    dates = @{
        [NSNumber numberWithInt:0]:@"21/09/2014",
        [NSNumber numberWithInt:1]:@"22/09/2014",
        [NSNumber numberWithInt:2]:@"23/09/2014",
        [NSNumber numberWithInt:3]:@"24/09/2014",
        [NSNumber numberWithInt:4]:@"25/09/2014",
        [NSNumber numberWithInt:5]:@"26/09/2014",
        [NSNumber numberWithInt:6]:@"27/09/2014",
        [NSNumber numberWithInt:7]:@"28/09/2014"
        };
    
    return dates;
}


+(NSDictionary*)indexByEventDates{
    NSDictionary* dates = nil;
    
    dates = @{
        @"21/09/2014":[NSNumber numberWithInt:0],
        @"22/09/2014":[NSNumber numberWithInt:1],
        @"23/09/2014":[NSNumber numberWithInt:2],
        @"24/09/2014":[NSNumber numberWithInt:3],
        @"25/09/2014":[NSNumber numberWithInt:4],
        @"26/09/2014":[NSNumber numberWithInt:5],
        @"27/09/2014":[NSNumber numberWithInt:6],
        @"28/09/2014":[NSNumber numberWithInt:7]
        };
    
    return dates;
}

@end
