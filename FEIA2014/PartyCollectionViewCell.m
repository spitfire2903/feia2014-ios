//
//  PartyCollectionViewCell.m
//  FEIA2014
//
//  Created by Ricardo Nunes de Miranda on 09/09/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "PartyCollectionViewCell.h"

@interface PartyCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *eventPlaceDate;

@end

@implementation PartyCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)cellWithEvent:(Event*)event{
    
    self.eventName.text = event.name;
    self.eventPlaceDate.text = [NSString stringWithFormat:@"%@ %@", [event getDateString], [event getTimeString]];
    
    self.eventName.font = [UIFont geosansLightWithSize:22];
    self.eventPlaceDate.font = [UIFont geosansLightObliqueWithSize:16];
    
    self.backgroundColor = [UIColor clearColor];//[UIColor colorWithPatternImage:bkgImage];
}

@end
