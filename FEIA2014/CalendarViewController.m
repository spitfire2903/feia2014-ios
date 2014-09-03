//
//  CalendarViewController.m
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()<UITableViewDataSource,UITableViewDelegate>

//@property (weak, nonatomic) IBOutlet UILabel *noEventsView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray* myEvents;

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

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.myEvents = [[EventManager sharedDatabase] myEvents];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.myEvents count];
}


#pragma mark - tableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myEventsCell"];
    
    NSString *eventName = nil;//[[self.myEvents objectAtIndex:indexPath.row] valueForKey:@"eventId"];
    NSNumber* eventId = [[self.myEvents objectAtIndex:indexPath.row] valueForKey:@"eventId"];
    
    
    for (Event* e in [[EventManager sharedDatabase] events]) {
        if([e.eventId intValue] == [eventId intValue]){
            eventName = e.name;
        }
    }
    
    cell.textLabel.text = eventName;
    
    return cell;
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
