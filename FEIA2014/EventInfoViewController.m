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
@property (weak, nonatomic) IBOutlet UILabel *eventAuthor;
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
    
    UIColor* bkColor = nil;
    NSString* eventPlaceDate = nil;
    
    self.eventName.textColor = [UIColor whiteColor];
    self.eventDate.textColor = [UIColor whiteColor];
    self.eventDescription.textColor = [UIColor colorwithR:139 g:55 b:23 a:1];
    
    self.eventName.font = [UIFont systemFontOfSize:26];
    self.eventHeaderImage.image = [[UIImage imageNamed:@"bkg_cabelos_branco"] imageByApplyingAlpha:0.3];
    self.eventHeaderImage.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.eventHeader sendSubviewToBack:self.eventHeaderImage];

    self.eventName.text = self.event.name;
    
    if(self.event.placeData && self.event.placeData.length > 0){
        eventPlaceDate = [NSString stringWithFormat:@"%@ - %@ %@", self.event.placeData, [self.event getDateString], [self.event getTimeString]];
    } else{
        eventPlaceDate = [NSString stringWithFormat:@"%@ %@", [self.event getDateString], [self.event getTimeString]];
    }
    
    self.eventDate.text = eventPlaceDate;

    self.eventDescription.text = self.event.shortDescription;
    
    if(self.event.author && self.event.author.length > 0){
        self.eventAuthor.text = self.event.author;
    } else{
        self.eventAuthor.text = @"";
    }
    
    /*self.eventDescription.font = [UIFont geosansLightWithSize:30];
    self.eventDescription.text = @"Esse ano, seguindo a máxima de que \"saco vazio não para em pé\", a organização do FEIA realizou uma parceria inédita com alguns restaurantes de Barão Geraldo para realizar o Banquete FEIA. O Banquete FEIA consiste em uma lista de restaurantes, que você confere abaixo, em que cada um oferece um prato a um preço especial para todo mundo que apresentar essa programação.\n\nEsse ano, seguindo a máxima de que \"saco vazio não para em pé\", a organização do FEIA realizou uma parceria inédita com alguns restaurantes de Barão Geraldo para realizar o Banquete FEIA. O Banquete FEIA consiste em uma lista de restaurantes, que você confere abaixo, em que cada um oferece um prato a um preço especial para todo mundo que apresentar essa programação.\n\n";
     */
    //[self.eventDescription sizeToFit];
    
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
        case EVENT_CATEGORY_GENERAL:
            bkColor = [UIColor creditsColor];
            break;
    }
    
    if(self.event.type == EVENT_TYPE_PARTY){
        bkColor = [UIColor partyColor];
    }
    
    self.eventHeader.backgroundColor = bkColor;
    
    if([[EventManager sharedDatabase] isEventFavorited:self.event.eventId]){
        [self disableSave];
    }
    
    [self hideLoading];
}

-(void)disableSave{
    NSDictionary* barButtonSettings = @{
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    };
    [self.btnSave setTitle:@"Salvo"];
    [self.btnSave setTitleTextAttributes:barButtonSettings forState:UIControlStateNormal];
    [self.btnSave setTitleTextAttributes:barButtonSettings forState:UIControlStateDisabled];
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
