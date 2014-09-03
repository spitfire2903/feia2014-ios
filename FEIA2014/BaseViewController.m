//
//  BaseViewController.m
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     // http://www.appcoda.com/customize-navigation-status-bar-ios-7/
    UIColor* backgroundNavigationBar = [UIColor colorWithRed:125/255 green:85/255 blue:85/255 alpha:1];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBackgroundColor:backgroundNavigationBar];
    //[destination.navigationBar setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundColor:backgroundNavigationBar];
     
     
     
     NSShadow* shadow = [NSShadow new];
     shadow.shadowOffset = CGSizeMake(0.0f, 1.0f);
     shadow.shadowColor = [UIColor redColor];
     [[UINavigationBar appearance] setTitleTextAttributes: @{
     NSForegroundColorAttributeName: [UIColor greenColor],
     NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:20.0f],
     NSShadowAttributeName: shadow
     }];
     
     // Alterar back button
     NSDictionary *normalAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
     [UIFont fontWithName:_dataManager.optionsSettings.fontString size:15], NSFontAttributeName,
     nil];
     [[UIBarButtonItem appearance] setTitleTextAttributes:normalAttributes
     forState:UIControlStateNormal];
     
     [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
     [UIFont fontWithName:@"mplus-1c-regular" size:21],
     NSFontAttributeName, nil]];
    */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showLoading{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)hideLoading{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}


@end
