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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnSave;
@property (weak, nonatomic) IBOutlet UIImageView *eventHeaderImage;

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

- (IBAction)saveEvent:(id)sender {
    [self disableSave];
    NSError *error = nil;
    AppDelegate *appDelegate = nil;
    NSManagedObjectContext *context = nil;
    NSManagedObject *newEvent = nil;
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    newEvent = [NSEntityDescription insertNewObjectForEntityForName:@"MyEvent" inManagedObjectContext:context];
    
    [newEvent setValue:self.event.eventId forKey:@"eventId"];

    [context save:&error];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self showLoading];
    
    NSDateFormatter* dt = nil;
    UIColor* bkColor = nil;
    
    dt = [[NSDateFormatter alloc] init];
    [dt setDateFormat:@"dd/MM - HH:mm"];
    
    self.eventName.textColor = [UIColor whiteColor];
    self.eventDate.textColor = [UIColor whiteColor];
    self.eventDescription.textColor = [UIColor colorwithR:139 g:55 b:23 a:1];
    
    self.eventName.font = [UIFont geosansLightWithSize:26];
    self.eventHeaderImage.image = [[UIImage imageNamed:@"bkg_cabelos_branco"] imageByApplyingAlpha:0.3];
    self.eventHeaderImage.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.eventHeader sendSubviewToBack:self.eventHeaderImage];

    self.eventName.text = self.event.name;
    self.eventDate.text = [NSString stringWithFormat:@"%@ %@", [self.event getDateString], [self.event getTimeString]];
    self.eventDescription.text = self.event.shortDescription;
    
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
    
    if([[EventManager sharedDatabase] isEventFavorited:self.event.eventId]){
        [self disableSave];
    }
    
    [self hideLoading];
}

-(void)disableSave{
    [self.btnSave setTitle:@"Salvo"];
    self.btnSave.enabled = NO;
    self.btnSave.tintColor = [UIColor darkGrayColor];
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
