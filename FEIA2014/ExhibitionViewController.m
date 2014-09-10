//
//  ExhibitionViewController.m
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "ExhibitionViewController.h"

static NSString* const EVENT_INFO_SEGUE = @"exhibitionInfoSegue";
static NSString* const EXHIBITION_CELL_IDENTIFIER = @"exhibitionCell";

@interface ExhibitionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray* eventList;

@end

@implementation ExhibitionViewController

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

    NSString* title = nil;
    
    switch (self.category) {
        case EVENT_CATEGORY_GENERAL:
            title = @"Oficinas Interdisciplinares";
            
            break;
        case EVENT_CATEGORY_VISUAL_ARTS:
            title = @"Oficinas de Artes Visuais";
            
            break;
        case EVENT_CATEGORY_PERFORMING_ARTS:
            title = @"Oficinas de Artes Cênicas";
            
            break;
        case EVENT_CATEGORY_DANCING:
            title = @"Oficinas de Dança";
            
            break;
        case EVENT_CATEGORY_MEDIALOGY:
            title = @"Oficinas de Midialogia";
            
            break;
        case EVENT_CATEGORY_MUSIC:
            title = @"Oficinas de Música";
            
            break;
    }
    
    [self setTitle:title];
    
    self.view.backgroundColor = [UIColor colorwithR:202 g:133 b:109 a:1];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self showLoading];
    
    [[self.collectionView backgroundView] removeFromSuperview];
    
    UIImageView* backgroundImage = nil;
    UIImage* image = nil;
    
    image = [UIImage imageNamed:@"bkg_cabelos_branco"];
    
    image = [image imageByApplyingAlpha:0.2];
    
    backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height)];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImage.image = image;
    
    self.collectionView.backgroundView = backgroundImage;
    
    self.eventList = [[EventManager sharedDatabase] eventByType:EVENT_TYPE_WORKSHOP andCategory:self.category];
    
    [self.collectionView reloadData];
 
    [self hideLoading];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Event* eventSelected = nil;
    
    for (NSIndexPath* indexPath in [self.collectionView indexPathsForSelectedItems]) {
        eventSelected = [self.eventList objectAtIndex:indexPath.row];
    }
    
    if ([[segue identifier] isEqualToString:EVENT_INFO_SEGUE]) {
        
        EventInfoViewController *info = [segue destinationViewController];
        info.event = eventSelected;
    }
}

#pragma mark - UICollectionViewDelegate/DataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ExhibitionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:EXHIBITION_CELL_IDENTIFIER forIndexPath:indexPath];
    Event* event = [self.eventList objectAtIndex:indexPath.row];
    
    [cell cellWithEvent:event];
    
    return cell;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.eventList count];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:EVENT_INFO_SEGUE sender:self];
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 12.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 16;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 12, 12, 12);
}

@end
