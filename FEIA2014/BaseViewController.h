//
//  BaseViewController.h
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SASlideMenu/SASlideMenuViewController.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <ObjectiveSugar/ObjectiveSugar.h>
#import "UIColor+FEIA.h"
#import "UIImage+FEIA.h"
#import "NSDate+FEIA.h"
#import "EventManager.h"
#import "Event.h"
#import "FEIACategoryPickerTextField.h"

@interface BaseViewController : UIViewController

@property (nonatomic,strong) SASlideMenuViewController* menuViewController;

-(void)showLoading;
-(void)hideLoading;

@end
