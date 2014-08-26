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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Event* eventSelected = nil;
    
    for (NSIndexPath* indexPath in [self.collectionView indexPathsForSelectedItems]) {
        eventSelected = [[[EventManager sharedDatabase] events] objectAtIndex:indexPath.row];
    }
    
    if ([[segue identifier] isEqualToString:EVENT_INFO_SEGUE]) {
    
        EventInfoViewController *info = [segue destinationViewController];
        info.event = eventSelected;
    }
}

#pragma mark - UICollectionViewDelegate/DataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIColor* bkColor = nil;
    FeiaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FEIA_CELL forIndexPath:indexPath];
    Event* event = [[[EventManager sharedDatabase] events] objectAtIndex:indexPath.row];
    
    [cell cellWithName:event.name andDate:event.date];
    
    switch (event.category) {
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
    
    cell.backgroundColor = bkColor;
    
    return cell;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[[EventManager sharedDatabase] events] count];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:EVENT_INFO_SEGUE sender:self];
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 1.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 2.0;
}


@end
