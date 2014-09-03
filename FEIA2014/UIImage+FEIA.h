//
//  UIImage+FEIA.h
//  FEIA2014
//
//  Created by MC1 on 9/1/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FEIA)

+ (UIImage *)image:(UIImage *)img withColor:(UIColor *)color;

- (UIImage *)imageByApplyingAlpha:(CGFloat) alpha;

@end
