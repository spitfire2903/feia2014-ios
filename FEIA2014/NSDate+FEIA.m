//
//  NSDate+FEIA.m
//  FEIA2014
//
//  Created by MC1 on 8/26/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "NSDate+FEIA.h"


static NSString* const DEFAULT_TIMEZONE_NAME = @"GMT";
static NSString* const DEFAULT_LOCALE = @"";
static NSString* const DEFAULT_DATE_PATTERN = @"dd/MM/yyyy";
static NSString* const DEFAULT_DATE_HOUR_PATTERN = @"dd/MM/yyyy HH:mm:ss";

@implementation NSDate (FEIA)


-(NSDate*)lastDayOfMonth {
    
    NSInteger dayCount = [self numberOfDaysInMonthCount];
    
    NSCalendar *calendar = [NSDate getCurrentCalendar];
    
    NSDateComponents *comp = [calendar components:
                              NSYearCalendarUnit |
                              NSMonthCalendarUnit |
                              NSDayCalendarUnit fromDate:self];
    
    [comp setDay:dayCount];
    
    return [calendar dateFromComponents:comp];
}

-(NSDate*)firstDayOfWeek{
    NSCalendar *calendar = nil;
    NSDate* date = nil;
    NSDateComponents *components = nil;
    int dayOfWeek = 0;
    
    calendar = [NSDate getCurrentCalendar];
    
    components = [calendar components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    
    dayOfWeek = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:self] weekday];
    // this will give you current day of week
    [components setDay:([components day] - ((dayOfWeek) - 2))];
    
    // for beginning of the week.
    date = [calendar dateFromComponents:components];
    
    return date;
}

-(NSDate*)lastDayOfWeek{
    NSCalendar *calendar = nil;
    NSDate* date = nil;
    NSDateComponents *components = nil;
    int dayOfWeek = 0;
    
    calendar = [NSDate getCurrentCalendar];
    
    components = [calendar components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    
    dayOfWeek = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:self] weekday];
    // this will give you current day of week
    [components setDay:([components day]+(7-dayOfWeek)+1)];
    
    // for ending of the week.
    date = [calendar dateFromComponents:components];
    
    return date;
}

-(NSInteger)numberOfDaysInMonthCount {
    
    NSCalendar *calendar = [NSDate getCurrentCalendar];
    
    //    [calendar setTimeZone:[NSTimeZone timeZoneWithName:TIMEZONE]];
    
    NSRange dayRange = [calendar rangeOfUnit:NSDayCalendarUnit
                                      inUnit:NSMonthCalendarUnit
                                     forDate:self];
    
    return dayRange.length;
}

- (NSInteger)numberOfWeekInMonthCount {
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    
    // The first day of week will be monday
    [calender setFirstWeekday:2];
    
    NSRange weekRange = [calender rangeOfUnit:NSWeekCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    return weekRange.length;
}

-(NSDate*)dateByAddingNumberOfHours:(int)hoursToAdd{
    return [self dateByAddingTimeInterval:60*60*hoursToAdd];
}

-(NSDate*)dateByAddingNumberOfDays:(int)daysToAdd{
    return [self dateByAddingTimeInterval:60*60*24*daysToAdd];
}

-(NSDate*)dateByAddingNumberOfMonths:(int)monthsToAdd{
    NSCalendar *gregorian = [NSDate getCurrentCalendar];
    
    NSDateComponents *dateComponents = [self componentsOfDate];
    
    dateComponents.month += monthsToAdd;
    
    NSDate *referenceDate = [gregorian dateFromComponents: dateComponents];
    
    return referenceDate;
}

-(NSDate*)dateByAddingNumberOfWeeks:(int)weeksToAdd{
    return [self dateByAddingTimeInterval:60*60*24*(weeksToAdd*7)];
}


- (NSDateComponents *)componentsOfDate{
    
    return [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday | NSHourCalendarUnit |
            NSMinuteCalendarUnit fromDate:self];
}

#pragma mark - Methods Statics

+ (NSDateComponents *)componentsOfCurrentDate {
    
    return [NSDate componentsOfDate:[NSDate date]];
}

+ (NSDateComponents *)componentsOfDate:(NSDate *)date {
    
    return [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth| NSHourCalendarUnit |
            NSMinuteCalendarUnit fromDate:date];
}


+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour min:(NSInteger)min {
    
    NSCalendar *calendar = [self getCurrentCalendar];
    NSDateComponents *components = [NSDate componentsWithYear:year month:month day:day hour:hour min:min];
    
    return [calendar dateFromComponents:components];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    
    NSCalendar *calendar = [self getCurrentCalendar];
    NSDateComponents *components = [NSDate componentsWithYear:year month:month day:day];
    
    return [calendar dateFromComponents:components];
}

+ (NSDate *)dateWithHour:(NSInteger)hour min:(NSInteger)min {
    
    NSCalendar *calendar = [self getCurrentCalendar];
    NSDateComponents *components = [NSDate componentsWithHour:hour min:min];
    
    return [calendar dateFromComponents:components];
}

+ (NSString *)stringTimeOfDate:(NSDate *)date {
    
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    [dateFormater setDateFormat:@"HH:mm"];
    
    return [dateFormater stringFromDate:date];
}

+ (NSDateComponents *)componentsWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour min:(NSInteger)min {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    [components setHour:hour];
    [components setMinute:min];
    
    return components;
}


+ (NSDateComponents *)componentsWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    
    return components;
}

+ (NSDateComponents *)componentsWithHour:(NSInteger)hour min:(NSInteger)min {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setHour:hour];
    [components setMinute:min];
    
    return components;
}


- (BOOL)isTheSameDate:(NSDate*)date {
    NSCalendar* calendar = [NSDate getCurrentCalendar];
    NSCalendarUnit units = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDateComponents* compA = nil;
    NSDateComponents* compB = nil;
    
    [calendar setFirstWeekday:2];
    
    compA = [calendar components:units fromDate:self];
    
    compB = [calendar components:units fromDate:date];
    
    return [NSDate isTheSameDateTheCompA:compA compB:compB];
}

+ (BOOL)isTheSameDateTheCompA:(NSDateComponents *)compA compB:(NSDateComponents *)compB {
    
    return ([compA day]==[compB day] && [compA month]==[compB month ]&& [compA year]==[compB year]);
}

+ (BOOL)isTheSameTimeTheCompA:(NSDateComponents *)compA compB:(NSDateComponents *)compB {
    
    return ([compA hour]==[compB hour] && [compA minute]==[compB minute]);
}



- (NSDate*) dateByString:(NSString*)date{
    return [self dateByString:date withFormat:DEFAULT_DATE_PATTERN];
}

- (NSDate*) dateByString:(NSString*)date withFormat:(NSString*)formatPattern{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:formatPattern];
    return [formatter dateFromString:date];
}

- (NSString *)dateToString{
    return [self dateToStringWithFormat:DEFAULT_DATE_PATTERN];
}

- (NSString *)dateToStringWithFormat:(NSString*)formatPattern{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:formatPattern];
    
    return [formatter stringFromDate:self];
}

+ (NSCalendar*) getCurrentCalendar{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    //[calendar setTimeZone:[NSTimeZone timeZoneWithName:DEFAULT_TIMEZONE_NAME]];
    [calendar setFirstWeekday:2];
    
    return calendar;
}
/*
+ (NSArray *)weekDaysAbrevString
{
    static NSArray *_weekDaysAbrev;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _weekDaysAbrev = @[
                           NSLocalizedString(@"date_weekday_sun", nil),
                           NSLocalizedString(@"date_weekday_mon", nil),
                           NSLocalizedString(@"date_weekday_tue", nil),
                           NSLocalizedString(@"date_weekday_wed", nil),
                           NSLocalizedString(@"date_weekday_thu", nil),
                           NSLocalizedString(@"date_weekday_fri", nil),
                           NSLocalizedString(@"date_weekday_sat", nil)
                           ];
    });
    return _weekDaysAbrev;
}


+ (NSArray *)monthsAbrevString
{
    static NSArray *_monthsAbrevString;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _monthsAbrevString = @[
                               NSLocalizedString(@"date_month_jan", nil),
                               NSLocalizedString(@"date_month_feb", nil),
                               NSLocalizedString(@"date_month_mar", nil),
                               NSLocalizedString(@"date_month_apr", nil),
                               NSLocalizedString(@"date_month_may", nil),
                               NSLocalizedString(@"date_month_jun", nil),
                               NSLocalizedString(@"date_month_jul", nil),
                               NSLocalizedString(@"date_month_aug", nil),
                               NSLocalizedString(@"date_month_sep", nil),
                               NSLocalizedString(@"date_month_oct", nil),
                               NSLocalizedString(@"date_month_nov", nil),
                               NSLocalizedString(@"date_month_dec", nil)
                               ];
    });
    return _monthsAbrevString;
}


+ (NSArray *)weekDaysString
{
    static NSArray *_weekDays;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _weekDays = @[
                      NSLocalizedString(@"date_weekday_sunday", nil),
                      NSLocalizedString(@"date_weekday_monday", nil),
                      NSLocalizedString(@"date_weekday_tuesday", nil),
                      NSLocalizedString(@"date_weekday_wednesday", nil),
                      NSLocalizedString(@"date_weekday_thursday", nil),
                      NSLocalizedString(@"date_weekday_friday", nil),
                      NSLocalizedString(@"date_weekday_saturday", nil)
                      ];
    });
    return _weekDays;
}


+ (NSArray *)monthsString
{
    static NSArray *_monthsString;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _monthsString = @[
                          NSLocalizedString(@"date_month_january", nil),
                          NSLocalizedString(@"date_month_february", nil),
                          NSLocalizedString(@"date_month_march", nil),
                          NSLocalizedString(@"date_month_april", nil),
                          NSLocalizedString(@"date_month_may", nil),
                          NSLocalizedString(@"date_month_june", nil),
                          NSLocalizedString(@"date_month_july", nil),
                          NSLocalizedString(@"date_month_august", nil),
                          NSLocalizedString(@"date_month_september", nil),
                          NSLocalizedString(@"date_month_october", nil),
                          NSLocalizedString(@"date_month_november", nil),
                          NSLocalizedString(@"date_month_december", nil)
                          ];
    });
    return _monthsString;
}*/

// Changes to pick only dates between 21 and 28 of September
+ (NSDate *)randomDateInYearOfDate {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[NSDate new]];
    
    //[comps setMonth:arc4random_uniform(12)];
    [comps setMonth:9];
    
    //NSRange range = [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[currentCalendar dateFromComponents:comps]];
    
    int daysToAdd = arc4random_uniform(8);
    
    //[comps setDay:arc4random_uniform(range.length)];
    [comps setDay:21+daysToAdd];
    
    // Normalise the time portion
    //[comps setHour:0];
    [comps setHour:arc4random_uniform(24)];
    [comps setMinute:0];
    [comps setSecond:0];
    //[comps setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    
    return [currentCalendar dateFromComponents:comps];
}

@end
