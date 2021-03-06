//
//  MainViewController.h
//  FEIA2014
//
//  Created by MC1 on 8/12/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "FeiaCollectionViewCell.h"
#import "EventInfoViewController.h"

@interface MainViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,FEIACategoryPickerDelegate>

@property EventType eventType;
@property EventCategory eventCategory;

@end
