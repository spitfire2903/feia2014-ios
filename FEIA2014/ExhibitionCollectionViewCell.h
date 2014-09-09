//
//  ExhibitionCollectionViewCell.h
//  FEIA2014
//
//  Created by MC1 on 9/9/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "UIFont+FEIA.h"

@interface ExhibitionCollectionViewCell : UICollectionViewCell

-(void)cellWithEvent:(Event*)event;

@end
