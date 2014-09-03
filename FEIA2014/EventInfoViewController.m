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
    /*if([sender isKindOfClass:[UIButton class]]){
        UIButton* button = sender;
        
        [sender setTitle:@"Salvo"];
        [sender setReadOnly:YES];
        [sender setUserInteractionEnabled:NO];
    }*/
    [self.btnSave setTitle:@"Salvo"];
    self.btnSave.enabled = NO;
    self.btnSave.tintColor = [UIColor darkGrayColor];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //MyEvent* myEvent = [[MyEvent alloc] init];
    
    //myEvent.eventId = self.event.eventId;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSManagedObject *newEvent;
    
    NSError *error;
    
    newEvent = [NSEntityDescription insertNewObjectForEntityForName:@"MyEvent" inManagedObjectContext:context];
    
    [newEvent setValue:self.event.eventId forKey:@"eventId"];
    
    [context save:&error];

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
    
    NSArray* myEvents = nil;
    
    myEvents = [[EventManager sharedDatabase] myEvents];
    
    
    
    for (MyEvent* event in myEvents) {
        NSLog(@"event.eventId %d", [event.eventId intValue]);
        NSLog(@"self.event.eventId %d", [self.event.eventId intValue]);
        NSLog(@"equals?! %d", [event.eventId intValue] == [self.event.eventId intValue]);
        
        if([event.eventId intValue] == [self.event.eventId intValue]){
            [self.btnSave setTitle:@"Salvo"];
            self.btnSave.enabled = NO;
            self.btnSave.tintColor = [UIColor darkGrayColor];
        }
    }
    
    
    UIImage* image = nil;
    /*
    switch (self.event.category) {
        case EVENT_CATEGORY_DANCING:
            image = [UIImage imageNamed:@"bkg_dancing"];
            break;
        case EVENT_CATEGORY_MUSIC:
            image = [UIImage imageNamed:@"bkg_music"];
            break;
        case EVENT_CATEGORY_VISUAL_ARTS:
            image = [UIImage imageNamed:@"bkg_visual_arts"];
            break;
        case EVENT_CATEGORY_PERFORMING_ARTS:
            image = [UIImage imageNamed:@"bkg_performing_arts"];
            break;
        case EVENT_CATEGORY_MEDIALOGY:
            image = [UIImage imageNamed:@"bkg_medialogy"];
            break;
    }
    
    self.eventHeader.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:0.4];
     */
    /*
    image = [UIImage imageNamed:@"bkg_feia_2"];
    self.eventHeader.backgroundColor = [UIColor colorWithPatternImage:image];
      */
    //self.eventName.textColor = [UIColor blackColor];
    //self.eventDate.textColor = [UIColor blackColor];
    
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
