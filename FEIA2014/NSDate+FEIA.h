//
//  NSDate+FEIA.h
//  FEIA2014
//
//  Created by MC1 on 8/26/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FEIA)

+ (NSDate *)randomDateInYearOfDate;


- (NSDate *)lastDayOfMonth;
- (NSInteger)numberOfDaysInMonthCount;
- (NSInteger)numberOfWeekInMonthCount;
- (NSDateComponents *)componentsOfDate;

// For week starting in monday
-(NSDate*)firstDayOfWeek;
-(NSDate*)lastDayOfWeek;

-(NSDate*)dateByAddingNumberOfDays:(int)daysToAdd;
-(NSDate*)dateByAddingNumberOfHours:(int)hoursToAdd;
-(NSDate*)dateByAddingNumberOfMonths:(int)monthsToAdd;
-(NSDate*)dateByAddingNumberOfWeeks:(int)weeksToAdd;

- (BOOL)isTheSameDate:(NSDate*)date;

+ (NSString *)stringDayOfDate:(NSDate *)date;
+ (NSString *)stringTimeOfDate:(NSDate *)date;
+ (NSDateComponents *)componentsOfCurrentDate;
+ (NSDateComponents *)componentsOfDate:(NSDate *)date;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour min:(NSInteger)min;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDate *)dateWithHour:(NSInteger)hour min:(NSInteger)min;
+ (NSDateComponents *)componentsWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour min:(NSInteger)min;
+ (NSDateComponents *)componentsWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDateComponents *)componentsWithHour:(NSInteger)hour min:(NSInteger)min;
+ (BOOL)isTheSameDateTheCompA:(NSDateComponents *)compA compB:(NSDateComponents *)compB;
+ (BOOL)isTheSameTimeTheCompA:(NSDateComponents *)compA compB:(NSDateComponents *)compB;
+ (NSCalendar*) getCurrentCalendar;
/*
+ (NSArray *)weekDaysAbrevString;
+ (NSArray *)monthsAbrevString;
+ (NSArray *)weekDaysString;
+ (NSArray *)monthsString;
*/
@end
