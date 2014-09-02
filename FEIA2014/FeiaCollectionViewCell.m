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
    NSDateFormatter* dt = nil;
    UIImage* bkgImage = nil;
    
    dt = [[NSDateFormatter alloc] init];
    [dt setDateFormat:@"dd/MM - HH:mm"];
    
    self.eventName.text = event.name;
    self.eventDate.text = [dt stringFromDate:event.date];
    self.eventIcon.image = [event getIcon];
    
    switch(event.category){
        case EVENT_CATEGORY_DANCING:
            bkgImage = [UIImage imageNamed:@"bkg2_dancing"];
            break;
        case EVENT_CATEGORY_VISUAL_ARTS:
            bkgImage = [UIImage imageNamed:@"bkg2_visual_arts"];
            break;
        case EVENT_CATEGORY_PERFORMING_ARTS:
            bkgImage = [UIImage imageNamed:@"bkg2_performing_arts"];
            break;
        case EVENT_CATEGORY_MUSIC:
            bkgImage = [UIImage imageNamed:@"bkg2_music"];
            break;
        case EVENT_CATEGORY_MEDIALOGY:
            bkgImage = [UIImage imageNamed:@"bkg2_medialogy"];
            break;
        case EVENT_CATEGORY_GENERAL:
            bkgImage = [UIImage imageNamed:@"bkg2_credits"];
            break;
    }
    
    self.backgroundColor = [UIColor colorWithPatternImage:bkgImage];
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
