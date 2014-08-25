//
//  MenuViewController.h
//  FEIA2014
//
//  Created by Ricardo Nunes de Miranda on 12/08/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseViewController.h"
#import <SASlideMenu/SASlideMenuDataSource.h>
#import <SASlideMenu/SASlideMenuDelegate.h>
#import <SASlideMenu/SASlideMenuViewController.h>

@interface MenuViewController : SASlideMenuViewController<SASlideMenuDataSource,SASlideMenuDelegate>


@end
