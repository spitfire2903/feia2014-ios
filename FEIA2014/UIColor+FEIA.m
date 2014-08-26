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

+ (UIColor *) dancingColor{
    return [self colorWithHexString:@"#d73027"];
}


+ (UIColor *) musicColor{
    return [self colorWithHexString:@"#fc8d59"];
}


+ (UIColor *) visualArtsColor{
    return [self colorWithHexString:@"#238443"/*@"#fee090"*/];
}


+ (UIColor *) performingArtsColor{
    return [self colorWithHexString:@"#91bfdb"];
}


+ (UIColor *) medialogyColor{
    return [self colorWithHexString:@"#4575b4"];
}
/*
 #d73027    #fc8d59    #fee090
 #e0f3f8    #91bfdb    #4575b4
*/

@end
