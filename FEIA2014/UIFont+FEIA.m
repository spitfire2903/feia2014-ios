//
//  UIFont+FEIA.m
//  FEIA2014
//
//  Created by MC1 on 9/3/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "UIFont+FEIA.h"

@implementation UIFont (FEIA)

+(void)showFonts{
    for (NSString* family in [UIFont familyNames]) {
        NSLog(@"\n> %@",family);
        
        for (NSString* name in [UIFont fontNamesForFamilyName:family]) {
            NSLog(@"  %@",name);
        }
    }
}

+(UIFont*)geosansLightWithSize:(CGFloat)fontSize{
    return [UIFont fontWithName:@"GeosansLight" size:fontSize];
}


+(UIFont*)geosansLightObliqueWithSize:(CGFloat)fontSize{
    return [UIFont fontWithName:@"GeosansLight-Oblique" size:fontSize];
}

@end
