//
//  ExhibitionViewController.h
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "BaseViewController.h"
#import "EventInfoViewController.h"
#import "ExhibitionCollectionViewCell.h"

@interface ExhibitionViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic) EventCategory category;

@end
