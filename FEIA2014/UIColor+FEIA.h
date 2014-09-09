//
//  UIColor+FEIA.h
//  FEIA2014
//
//  Created by MC1 on 8/26/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FEIA)

+(UIColor*)colorWithHexString:(NSString*)hex;
+(UIColor*)colorwithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;

+ (UIColor *) dancingColor;
+ (UIColor *) musicColor;
+ (UIColor *) visualArtsColor;
+ (UIColor *) performingArtsColor;
+ (UIColor *) medialogyColor;
+ (UIColor *) generalColor;
+ (UIColor *) creditsColor;
+ (UIColor *) partyColor;

@end
