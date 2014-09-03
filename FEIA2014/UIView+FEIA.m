//
//  UIView+FEIA.m
//  FEIA2014
//
//  Created by MC1 on 9/3/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "UIView+FEIA.h"

@implementation UIView (FEIA)

-(CGRect)frameDimen{
    return [self frameDimenWithX:0 andY:0];
}

-(CGRect)frameDimenWithX:(int)x andY:(int)y{
    return CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
}

@end
