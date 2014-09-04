//
//  MainViewController.m
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "MainViewController.h"

static NSString* const FEIA_CELL = @"feiaCell";
static NSString* const EVENT_INFO_SEGUE = @"eventInfoSegue";

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet FEIACategoryPickerTextField *eventCategoryField;

@property (nonatomic) NSArray* eventList;
@property (nonatomic) NSArray* eventFilteredList;

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

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.eventList = [[[EventManager sharedDatabase] events] mutableCopy];
    
    self.eventFilteredList = [self.eventList copy];
    
    self.eventCategoryField.categoryDelegate = self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[self.collectionView backgroundView] removeFromSuperview];
    
    UIImageView* backgroundImage = nil;
    UIImage* image = nil;

    image = [UIImage imageNamed:@"ic_logo_feia_rosa"];
    
    image = [image imageByApplyingAlpha:0.3];
    
    backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height)];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFit;
    backgroundImage.image = image;

    
    self.collectionView.backgroundView = backgroundImage;
    
}

-(void)didFinishPicker:(NSString *)category{
    NSPredicate* predicate = nil;
    
    [self.view endEditing:YES];
    
    [self showLoading];
    
    if([category isEqualToString:CATEGORY_FILTER_ALL]){
        self.eventFilteredList = self.eventList;
    } else{
        if([category isEqualToString:CATEGORY_FILTER_VISUAL_ARTS]){
            predicate = [NSPredicate predicateWithFormat:@"category = %d", EVENT_CATEGORY_VISUAL_ARTS];
        } else if([category isEqualToString:CATEGORY_FILTER_PERFORMING_ARTS]){
            predicate = [NSPredicate predicateWithFormat:@"category = %d", EVENT_CATEGORY_PERFORMING_ARTS];
        } else if([category isEqualToString:CATEGORY_FILTER_DANCING]){
            predicate = [NSPredicate predicateWithFormat:@"category = %d", EVENT_CATEGORY_DANCING];
        } else if([category isEqualToString:CATEGORY_FILTER_MEDIALOGY]){
            predicate = [NSPredicate predicateWithFormat:@"category = %d", EVENT_CATEGORY_MEDIALOGY];
        } else if([category isEqualToString:CATEGORY_FILTER_MUSIC]){
            predicate = [NSPredicate predicateWithFormat:@"category = %d", EVENT_CATEGORY_MUSIC];
        }

        self.eventFilteredList = [self.eventList filteredArrayUsingPredicate:predicate];
    }
   
    [self.collectionView reloadData];
    
    [self hideLoading];
}

-(int)parentWidth{
    return self.view.frame.size.width;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Event* eventSelected = nil;
    
    for (NSIndexPath* indexPath in [self.collectionView indexPathsForSelectedItems]) {
        eventSelected = [self.eventFilteredList objectAtIndex:indexPath.row];
    }
    
    if ([[segue identifier] isEqualToString:EVENT_INFO_SEGUE]) {
    
        EventInfoViewController *info = [segue destinationViewController];
        info.event = eventSelected;
    }
}

#pragma mark - UICollectionViewDelegate/DataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FeiaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FEIA_CELL forIndexPath:indexPath];
    Event* event = [self.eventFilteredList objectAtIndex:indexPath.row];
    
    [cell cellWithEvent:event];
    
    return cell;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.eventFilteredList count];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:EVENT_INFO_SEGUE sender:self];
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 12.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 12.0;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 12, 12, 12);
}

@end
