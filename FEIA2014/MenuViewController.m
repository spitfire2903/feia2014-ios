//
//  MenuViewController.m
//  FEIA2014
//
//  Created by Ricardo Nunes de Miranda on 12/08/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "MenuViewController.h"

static NSString* const MENU_CELL_IDENTIFIER = @"menuCell";

static NSString* const SEGUE_FEIA = @"feiaSegue";
static NSString* const SEGUE_CALENDAR = @"calendarSegue";
static NSString* const SEGUE_WORKSHOP = @"workshopSegue";
static NSString* const SEGUE_EXHIBITION = @"exhibitionSegue";
static NSString* const SEGUE_PARTY = @"partySegue";
static NSString* const SEGUE_PARTNER = @"partnerSegue";
static NSString* const SEGUE_MAP = @"mapSegue";
static NSString* const SEGUE_CONTACT = @"contactSegue";

@interface MenuViewController ()

//@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    if(cell){
        cell.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    }
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView* backgroundImage = nil;
    UIImage* image = nil;
    
    image = [UIImage imageNamed:@"ic_cara_feia_marrom"];//@"ic_logo_feia_rosa"];
    
    image = [image imageByApplyingAlpha:0.4];
    
    backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, self.tableView.frame.size.height)];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImage.image = image;
    
    self.tableView.backgroundView = backgroundImage;
    
    //self.tableView.delegate = self;
    //[self.tableView setShouldGroupAccessibilityChildren:YES];
    
    //self.tableView.dataSource = self;

    //self.title = NSLocalizedString(@"menuTitle", @"Title of menu section");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        
    } else{
        switch (indexPath.row) {
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
        }
    }
}

*/
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return YES;
}


#pragma mark -
#pragma mark SASlideMenuDataSource

-(NSIndexPath*) selectedIndexPath{
    return [NSIndexPath indexPathForRow:0 inSection:0];
}

-(NSString*) segueIdForIndexPath:(NSIndexPath *)indexPath{
    NSString* segueName = nil;
    
    if(indexPath.section == 0){
        switch (indexPath.row) {
            case 0:
                segueName = SEGUE_FEIA;
                
                break;
            case 1:
                segueName = SEGUE_CALENDAR;
                
                break;
        }
    } else if(indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
                segueName = SEGUE_EXHIBITION;
                
                break;
            case 1:
                segueName = SEGUE_WORKSHOP;
                
                break;
            case 2:
                segueName = SEGUE_PARTY;
                
                break;
            case 3:
                segueName = SEGUE_PARTNER;
                
                break;
            case 4:
                segueName = SEGUE_MAP;
                
                break;
            case 5:
                segueName = SEGUE_CONTACT;
                
                break;
        }
    }
    
    return segueName;
}

-(Boolean) allowContentViewControllerCachingForIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(Boolean) disablePanGestureForIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return YES;
    }
    return NO;
}

-(void) configureMenuButton:(UIButton *)menuButton{
    menuButton.frame = CGRectMake(0, 0, 40, 29);
    [menuButton setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
}

-(void) configureSlideLayer:(CALayer *)layer{
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 0.3;
    layer.shadowOffset = CGSizeMake(-5, 0);
    layer.shadowRadius = 5;
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:layer.bounds].CGPath;
}

-(CGFloat) leftMenuVisibleWidth{
    return 260;
}
-(void) prepareForSwitchToContentViewController:(UINavigationController *)content{
    UIViewController* controller = [content.viewControllers objectAtIndex:0];

    if ([controller isKindOfClass:[BaseViewController class]]) {
        BaseViewController* viewController = (BaseViewController*)controller;
        viewController.menuViewController = self;
    }
}

#pragma mark -
#pragma mark SASlideMenuDelegate


-(void) slideMenuWillSlideIn:(UINavigationController *)selectedContent{
    NSLog(@"slideMenuWillSlideIn");
}
-(void) slideMenuDidSlideIn:(UINavigationController *)selectedContent{
    NSLog(@"slideMenuDidSlideIn");
}
-(void) slideMenuWillSlideToSide:(UINavigationController *)selectedContent{
    NSLog(@"slideMenuWillSlideToSide");
}
-(void) slideMenuDidSlideToSide:(UINavigationController *)selectedContent{
    NSLog(@"slideMenuDidSlideToSide");
}
-(void) slideMenuWillSlideOut:(UINavigationController *)selectedContent{
    NSLog(@"slideMenuWillSlideOut");
}
-(void) slideMenuDidSlideOut:(UINavigationController *)selectedContent{
    NSLog(@"slideMenuDidSlideOut");
}
-(void) slideMenuWillSlideToLeft:(UINavigationController *)selectedContent{
    NSLog(@"slideMenuWillSlideToLeft");
}
-(void) slideMenuDidSlideToLeft:(UINavigationController *)selectedContent{
    NSLog(@"slideMenuDidSlideToLeft");
}


@end
