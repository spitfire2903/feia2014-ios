//
//  MainViewController.m
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "MainViewController.h"


static NSString* const SEGUE_CALENDAR = @"calendarSegue";
static NSString* const SEGUE_WORKSHOP = @"workshopSegue";
static NSString* const SEGUE_EXHIBITION = @"exhibitionSegue";
static NSString* const SEGUE_PARTY = @"partySegue";
static NSString* const SEGUE_PARTNER = @"partnerSegue";
static NSString* const SEGUE_MAP = @"mapSegue";
static NSString* const SEGUE_CONTACT = @"contactSegue";


@interface MainViewController ()


@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)button:(id)sender {
    
    [self performSegueWithIdentifier:SEGUE_CALENDAR sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
