//
//  PartyCollectionViewCell.h
//  FEIA2014
//
//  Created by Ricardo Nunes de Miranda on 09/09/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "UIFont+FEIA.h"

@interface PartyCollectionViewCell : UICollectionViewCell

-(void)cellWithEvent:(Event*)event;

@end
