//
//  FEIACategoryPickerTextField.m
//  FEIA2014
//
//  Created by MC1 on 9/1/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "FEIACategoryPickerTextField.h"

NSString* const CATEGORY_FILTER_ALL = @"Todos";
NSString* const CATEGORY_FILTER_VISUAL_ARTS = @"Artes Visuais";
NSString* const CATEGORY_FILTER_PERFORMING_ARTS = @"Artes Cênicas";
NSString* const CATEGORY_FILTER_DANCING = @"Dança";
NSString* const CATEGORY_FILTER_MEDIALOGY = @"Midialogia";
NSString* const CATEGORY_FILTER_MUSIC = @"Música";

@interface FEIACategoryPickerTextField()<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *pickerView;

@end

@implementation FEIACategoryPickerTextField

#pragma mark - Initialization

- (void)initialize
{
    [self setDelegate:self];
    
    self.pickerView = [[UIPickerView alloc] init];
    [self.pickerView setShowsSelectionIndicator:YES];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
    
    [self setInputView:self.pickerView];
    
    [self createInputAccessoryView];
    
    self.itemList = @[CATEGORY_FILTER_ALL,
                      CATEGORY_FILTER_VISUAL_ARTS,
                      CATEGORY_FILTER_PERFORMING_ARTS,
                      CATEGORY_FILTER_DANCING,
                      CATEGORY_FILTER_MEDIALOGY,
                      CATEGORY_FILTER_MUSIC];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initialize];
    }
    return self;
}

#pragma mark - UITextField overrides

- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    return CGRectZero;
}

#pragma mark - UIPickerView data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _itemList.count;
}

#pragma mark UIPickerView delegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *labelText = [[UILabel alloc] init];
    
    labelText.font = [UIFont boldSystemFontOfSize:20];
    labelText.backgroundColor = [UIColor clearColor];
    [labelText setTextAlignment:NSTextAlignmentCenter];
    [labelText setText:[_itemList objectAtIndex:row]];
    return labelText;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self setSelectedItem:[_itemList objectAtIndex:row]];
}

- (void)setItemList:(NSArray *)itemList
{
    _itemList = itemList;
    
    if ([self.text length] == 0 && [_itemList count] > 0)
    {
        //        [self setText:[_itemList objectAtIndex:0]];
    }
    [self.pickerView reloadAllComponents];
}

- (void)selectRow:(NSInteger)row animated:(BOOL)animated
{
    if (row < [_itemList count]) {
        self.text = @"";
        [self insertText:_itemList[row]];
        [self.pickerView selectRow:row inComponent:0 animated:animated];
    }
}

- (void)setSelectedItem:(NSString *)selectedItem
{

    if ([_itemList containsObject:selectedItem])
    {
        _selectedItem = selectedItem;
        self.text = @"";
        [self insertText:selectedItem];
        [self.pickerView selectRow:[_itemList indexOfObject:selectedItem] inComponent:0 animated:YES];
    }
}

-(void)createInputAccessoryView{
  
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [self.categoryDelegate parentWidth], 44)];
    UIBarButtonItem* btnDone = nil;
    
    //UIBarButtonItem* btnDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTyping)];
    //btnDone = [[UIBarButtonItem alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    btnDone = [[UIBarButtonItem alloc] initWithTitle:@"Pronto" style:UIBarButtonItemStyleDone target:self action:@selector(doneTyping)];
    //[btnDone setTitle:@"Pronto"];
    
    [keyboardToolbar setItems:@[btnDone]];
    
    [self setInputAccessoryView:keyboardToolbar];
}

-(void)doneTyping{
    [self endEditing:YES];
    
    [self resignFirstResponder];
    
    [self.categoryDelegate didFinishPicker:self.text];
}

#pragma mark - Getter

- (NSInteger)selectedRow {
    return [self.pickerView selectedRowInComponent:0];
}

@end
