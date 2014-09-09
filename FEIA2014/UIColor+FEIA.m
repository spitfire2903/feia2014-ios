//
//  UIColor+FEIA.m
//  FEIA2014
//
//  Created by MC1 on 8/26/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "UIColor+FEIA.h"

@implementation UIColor (FEIA)

+ (UIColor *)colorWithHexString:(NSString *)hex
{
    NSString *colorString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([colorString length] < 6) {
        return [UIColor grayColor];
    }
    
    // strip 0X if it appears
    if ([colorString hasPrefix:@"0X"]) {
        colorString = [colorString substringFromIndex:2];
    }
    
    
    // strip 0X if it appears
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    if ([colorString length] != 6) {
        return [UIColor grayColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [colorString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:1.0f];
}

+(UIColor*)colorwithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha{
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    
    r = red/255;
    g = green/255;
    b = blue/255;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

+ (UIColor *) dancingColor{
    return [self colorWithHexString:@"ED2459"];
    //return [self colorWithHexString:@"#d73027"];
}


+ (UIColor *) musicColor{
    return [self colorWithHexString:@"B5353B"];
    //return [self colorWithHexString:@"#fc8d59"];
}


+ (UIColor *) visualArtsColor{
    return [self colorWithHexString:@"DB5727"];
    //return [self colorWithHexString:@"#238443"/*@"#fee090"*/];
}


+ (UIColor *) performingArtsColor{
    return [self colorWithHexString:@"782014"];
    //return [self colorWithHexString:@"#91bfdb"];
}


+ (UIColor *) medialogyColor{
    return [self colorWithHexString:@"AB5333"];
    //return [self colorWithHexString:@"#4575b4"];
}

+ (UIColor *) generalColor{
    return [self colorWithHexString:@"EDB83B"];
}

+ (UIColor *) creditsColor{
    return [self colorWithHexString:@"A8AB8A"];
}

+ (UIColor *) partyColor{
    return [self colorWithHexString:@"BA4A4A"];
    //return [self colorWithHexString:@"523E44"];
}

/*
 #d73027    #fc8d59    #fee090
 #e0f3f8    #91bfdb    #4575b4
*/

@end
