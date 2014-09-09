//
//  FeiaCollectionViewCell.m
//  FEIA2014
//
//  Created by MC1 on 8/25/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "FeiaCollectionViewCell.h"

@interface FeiaCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *eventDate;
@property (weak, nonatomic) IBOutlet UIImageView *eventIcon;

@end

@implementation FeiaCollectionViewCell

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
    self.eventDate.text = [NSString stringWithFormat:@"%@ %@", [event getDateString], [event getTimeString]];
    self.eventIcon.image = [event getIcon];
    
    self.eventName.font = [UIFont geosansLightWithSize:22];
    self.eventDate.font = [UIFont geosansLightObliqueWithSize:16];
    
    self.backgroundColor = [UIColor clearColor];//[UIColor colorWithPatternImage:bkgImage];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
