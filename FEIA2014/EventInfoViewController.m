//
//  EventInfoViewController.m
//  FEIA2014
//
//  Created by MC1 on 8/26/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "EventInfoViewController.h"

@interface EventInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *eventDate;
@property (weak, nonatomic) IBOutlet UILabel *eventDescription;
@property (weak, nonatomic) IBOutlet UIView *eventHeader;

@end

@implementation EventInfoViewController

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
    
    [self showLoading];
    
    NSDateFormatter* dt = nil;
    UIColor* bkColor = nil;
    dt = [[NSDateFormatter alloc] init];
    [dt setDateFormat:@"dd/MM - HH:mm"];

    self.eventName.text = self.event.name;
    self.eventDate.text = [dt stringFromDate:self.event.date];
    //self.eventDescription.text = self.event.shortDescription;
    
    [self.eventDescription sizeToFit];
    
    switch (self.event.category) {
        case EVENT_CATEGORY_DANCING:
            bkColor = [UIColor dancingColor];
            break;
        case EVENT_CATEGORY_MUSIC:
            bkColor = [UIColor musicColor];
            break;
        case EVENT_CATEGORY_VISUAL_ARTS:
            bkColor = [UIColor visualArtsColor];
            break;
        case EVENT_CATEGORY_PERFORMING_ARTS:
            bkColor = [UIColor performingArtsColor];
            break;
        case EVENT_CATEGORY_MEDIALOGY:
            bkColor = [UIColor medialogyColor];
            break;
    }
    
    self.eventHeader.backgroundColor = bkColor;
    
    [self hideLoading];
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
