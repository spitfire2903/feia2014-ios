//
//  Partners.h
//  FEIA2014
//
//  Created by Ricardo Nunes de Miranda on 12/08/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PARTNER_CATEGORY_RESTAURANT = 0
} PartnerType;

@interface Partners : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) int category;
@property (nonatomic) NSString* shortDescription;
@property (nonatomic) NSString* address;
@property (nonatomic) NSString* site;

@end
