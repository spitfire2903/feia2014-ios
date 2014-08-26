//
//  EventManager.m
//  FEIA2014
//
//  Created by MC1 on 8/25/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "EventManager.h"

@interface EventManager()

@property (strong,nonatomic) NSMutableArray *eventList;

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
    return [self.eventList copy];
}

#pragma mark - Private methods

-(void) baseInit{
//    NSString* name = nil;
//    NSString* description = nil;
    NSArray *category = @[@"Dança", @"Música", @"Artes Visuas", @"Artes Cênicas", @"Midialogia"];
    
    [category each:^(id object) {
        //NSLog(@"Car: %@", object);
        int categoryIndex = [category indexOfObject:object];
        
       [@1 upto:4 do:^(NSInteger index) {
           
            NSString* name = [NSString stringWithFormat:@"Apresentação %@ %d", object, index];
            NSString* description = [NSString stringWithFormat:@"Apresentação Descrição %@ %d", object, index];
            NSDate* date = [NSDate randomDateInYearOfDate];
            
            [self.eventList addObject:[Event eventWithName:name andDate:date andDescription:description andType:EVENT_TYPE_EXHIBITION andCategory:categoryIndex]];
            
            name = [NSString stringWithFormat:@"Oficina %@ %d", object, index];
            description = [NSString stringWithFormat:@"Oficina Descrição %@ %d", object, index];
            date = [NSDate randomDateInYearOfDate];
            
            [self.eventList addObject:[Event eventWithName:name andDate:date andDescription:description andType:EVENT_TYPE_WORKSHOP andCategory:categoryIndex]];
        }];
    }];
    
    srandom(time(NULL));
    for (NSInteger x = 0; x < [self.eventList count]; x++) {
        NSInteger randInt = (random() % ([self.eventList count] - x)) + x;
        [self.eventList exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }
}

/*
-(void)swapOutlawsAtIndex:(NSInteger)firstIndex otherIndex:(NSInteger)secondIndex
{
    if (firstIndex >= 0 && firstIndex < [self.outlawList count] &&
        secondIndex >= 0 && secondIndex < [self.outlawList count]) {
        
        Outlaw *swapOutlaw = self.outlawList[firstIndex];
        
        [self.outlawList replaceObjectAtIndex:firstIndex withObject:self.outlawList[secondIndex]];
        [self.outlawList replaceObjectAtIndex:secondIndex withObject:swapOutlaw];
    }
}

-(void)removeOutlawAtIndex:(NSInteger)index
{
    if (index >= 0 && index < [self.outlawList count])
    {
        [self.outlawList removeObjectAtIndex:index];
    }
    
}

-(void)removeOutlaw:(Outlaw*)outlaw
{
    [self.outlawList removeObject:outlaw];
}

#pragma mark - Auxiliary methods

-(void)addOutlaw:(Outlaw *)outlaw;
{
    [self.outlawList addObject:outlaw];
}
*/

@end
