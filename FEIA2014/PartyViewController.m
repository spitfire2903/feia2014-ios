//
//  PartyViewController.m
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "PartyViewController.h"

static NSString* const PARTY_INFO_SEGUE = @"partyInfoSegue";
static NSString* const PARTY_CELL_IDENTIFIER = @"partyCell";

@interface PartyViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray* eventList;

@end

@implementation PartyViewController

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
    self.view.backgroundColor = [UIColor partyColor];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self showLoading];
    
    [[self.collectionView backgroundView] removeFromSuperview];
    
    UIImageView* backgroundImage = nil;
    UIImage* image = nil;
    
    image = [UIImage imageNamed:@"bkg_cabelos_branco"];
    
    image = [image imageByApplyingAlpha:0.18];
    
    backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height)];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImage.image = image;
    
    self.collectionView.backgroundView = backgroundImage;
    
    self.eventList = [[EventManager sharedDatabase] eventByType:EVENT_TYPE_PARTY];
    
    [self.collectionView reloadData];
    
    [self hideLoading];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Event* eventSelected = nil;
    
    for (NSIndexPath* indexPath in [self.collectionView indexPathsForSelectedItems]) {
        eventSelected = [self.eventList objectAtIndex:indexPath.row];
    }
    
    if ([[segue identifier] isEqualToString:PARTY_INFO_SEGUE]) {
        
        EventInfoViewController *info = [segue destinationViewController];
        info.event = eventSelected;
    }
}

#pragma mark - UICollectionViewDelegate/DataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PartyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PARTY_CELL_IDENTIFIER forIndexPath:indexPath];
    Event* event = [self.eventList objectAtIndex:indexPath.row];
    
    [cell cellWithEvent:event];
    
    return cell;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.eventList count];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:PARTY_INFO_SEGUE sender:self];
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 2;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 3;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 10, 10);
}


@end
