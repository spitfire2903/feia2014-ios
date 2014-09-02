//
//  FEIACategoryPickerTextField.h
//  FEIA2014
//
//  Created by MC1 on 9/1/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString* const CATEGORY_FILTER_ALL;
extern NSString* const CATEGORY_FILTER_VISUAL_ARTS;
extern NSString* const CATEGORY_FILTER_PERFORMING_ARTS;
extern NSString* const CATEGORY_FILTER_DANCING;
extern NSString* const CATEGORY_FILTER_MEDIALOGY;
extern NSString* const CATEGORY_FILTER_MUSIC;

@protocol FEIACategoryPickerDelegate

@required
-(void)didFinishPicker:(NSString*)category;
-(int)parentWidth;

@end

@interface FEIACategoryPickerTextField : UITextField

@property (nonatomic) id<FEIACategoryPickerDelegate> categoryDelegate;
@property (nonatomic, strong) NSArray *itemList;
@property (nonatomic, readonly) NSInteger selectedRow;
@property (nonatomic, strong) NSString *selectedItem;

- (void)selectRow:(NSInteger)row animated:(BOOL)animated;

@end
