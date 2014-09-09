//
//  CalendarViewController.m
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "CalendarViewController.h"

static NSString* const CALENDAR_CELL_IDENTIFIER = @"calendarCell";
static NSString* const EVENT_INFO_SEGUE = @"eventInfoSegue";

@interface CalendarViewController ()<UITableViewDataSource,UITableViewDelegate>

//@property (weak, nonatomic) IBOutlet UILabel *noEventsView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSDictionary* myEventsDict;

@end

@implementation CalendarViewController

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
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self showLoading];
    
    self.myEventsDict = [[EventManager sharedDatabase] myEventsDict];
    
    [[self.tableView backgroundView] removeFromSuperview];
    
    UIImageView* backgroundImage = nil;
    UIImage* image = nil;
    
    image = [UIImage imageNamed:@"ic_logo_feia_rosa"];
    
    image = [image imageByApplyingAlpha:0.3];
    
    backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.frame.size.height)];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFit;
    backgroundImage.image = image;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorColor:[[UIColor whiteColor] colorWithAlphaComponent:0.4]];
    self.tableView.backgroundView = backgroundImage;
    
    [self.tableView reloadData];
    
    [self hideLoading];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // TODO: verificar quais sections existem de verdade
    return 8;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString* sectionTitle = nil;
    NSArray* dayEvents = nil;
    
    dayEvents = [self.myEventsDict objectForKey:[NSNumber numberWithInteger:section]];
    
    if(dayEvents != nil && [dayEvents count] > 0){
        switch (section) {
            case 0:
                sectionTitle = @"21/09";
                
                break;
            case 1:
                sectionTitle = @"22/09";
                
                break;
            case 2:
                sectionTitle = @"23/09";
                
                break;
            case 3:
                sectionTitle = @"24/09";
                
                break;
            case 4:
                sectionTitle = @"25/09";
                
                break;
            case 5:
                sectionTitle = @"26/09";
                
                break;
            case 6:
                sectionTitle = @"27/09";
                
                break;
            case 7:
                sectionTitle = @"28/09";
                
                break;
        }
    }
    
    return sectionTitle;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray* eventsByDay = nil;
    
    eventsByDay = [self.myEventsDict objectForKey:[NSNumber numberWithInteger:section]];
    
    return [eventsByDay count];
}


#pragma mark - tableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* eventName = nil;
    NSString* eventTime = nil;
    UITableViewCell *cell = nil;
    NSArray* eventsByDay = nil;
    Event* event = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CALENDAR_CELL_IDENTIFIER];

    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CALENDAR_CELL_IDENTIFIER];
    }
    
    eventsByDay = [self.myEventsDict objectForKey:[NSNumber numberWithInteger:indexPath.section]];
    event = [eventsByDay objectAtIndex:indexPath.row];
    
    eventName = event.name;
    eventTime = [event getTimeString];
    
    cell.textLabel.text = eventName;
    cell.detailTextLabel.text = eventTime;
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:EVENT_INFO_SEGUE sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Event* eventSelected = nil;
    NSArray* eventsByDay = nil;
    NSIndexPath* indexPath = nil;
    
    indexPath = [self.tableView indexPathForSelectedRow];
    eventsByDay = [self.myEventsDict objectForKey:[NSNumber numberWithInteger:indexPath.section]];
    
    eventSelected = [eventsByDay objectAtIndex:indexPath.row];
    
    if ([[segue identifier] isEqualToString:EVENT_INFO_SEGUE]) {
        
        EventInfoViewController *info = [segue destinationViewController];
        info.event = eventSelected;
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
-(NSArray*)eventBySection:(NSIndexPath*)indexPath{
    NSArray* events = nil;
    
    switch (indexPath.section) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
            
    }
    
    return events;
}*/

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
