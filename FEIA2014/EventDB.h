//
//  EventDB.h
//  FEIA2014
//
//  Created by MC1 on 9/10/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EventDB : NSManagedObject

@property (nonatomic, retain) NSNumber * eventId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * shortDescript;
@property (nonatomic, retain) NSData * dateArray;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSNumber * category;
@property (nonatomic, retain) NSString * placeData;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSNumber * duration;

@end
