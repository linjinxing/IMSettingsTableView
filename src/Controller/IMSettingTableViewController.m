//
//  IMTableViewController.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMSettingTableViewController.h"
#import "IMSettingDataSource.h"
#import "IMTableViewUtility.h"
#import "IMSettingSaver.h"

#import "IMTextfieldTableViewCell.h"
#import "IMSwitchTableViewCell.h"
#import "IMButtonTableViewCell.h"
#import "IMPasswordTableViewCell.h"

#import "IMSettingDataSourceSection.h"
#import "IMSettingDataSourceSectonItem.h"

#define ToNSValue(val) [NSValue valueWithPointer:&val]

@interface IMSettingTableViewController()<UITextFieldDelegate>
@property(strong, nonatomic) id<IMSettingSaver> saver;
@end


@implementation IMSettingTableViewController

+ (instancetype)tableViewControllerWithDataSource:(id<IMSettingDataSource>)dataSrc
{
    IMSettingTableViewController* tableViewCtrl = [[[self class] alloc] initWithStyle:dataSrc.tableViewStyle];
    tableViewCtrl.dataSrc = dataSrc;
    [tableViewCtrl initSaver];
    return tableViewCtrl;
}

- (void)initSaver
{
    if (self.saver) {
        return;
    }
    NSMutableArray* keys = [NSMutableArray arrayWithCapacity:30];
    for (int i = 0; i < [self.dataSrc numOfSections]; ++i) {
        for (int j = 0; j < [self.dataSrc numberOfRowsInSection:i]; ++j) {
            NSString* str = [[self.dataSrc itemAtIndexPath:
                                                          [NSIndexPath indexPathForRow:j inSection:i]
                              ] key];
            if (str) {
                [keys addObject:str];
            }
        }
    }
    self.saver = [IMSettingSaver settingSaverWithKeys:keys];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSaver];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.saver save];
}

#pragma mark - subclass implemnt it to handler event
- (void)valueDidChange:(NSDictionary*)dict key:(NSString*)currentChangedKey
{
    NSLog(@"dict:%@, currentChangedKey:%@", dict, currentChangedKey);
}

- (void)buttonDidTouchUpInsideWithKey:(NSString*)key
{
    NSLog(@"key:%@", key);
}

#pragma mark -

- (Class)registerCellClassWithStyle:(IMTableViewCellStyle)style
{
    static dispatch_once_t onceTokenSystem, onceTokenTextfield, onceTokenSwitch, onceTokenButton,onceTokenPassword;
    
    NSString* keyToken = @"token";
    NSString* keyClass = @"class";

    NSDictionary* dictValueForSystemStyle = @{ keyToken: ToNSValue(onceTokenSystem),
                                               keyClass: [IMTableViewCell class]};
    
    NSDictionary* dict = @{
                           @(IMTableViewCellStyleDefault)  :  dictValueForSystemStyle,
                           @(IMTableViewCellStyleValue1)   :  dictValueForSystemStyle,
                           @(IMTableViewCellStyleValue2)   :  dictValueForSystemStyle,
                           @(IMTableViewCellStyleSubtitle) :  dictValueForSystemStyle,

                           @(IMTableViewCellStyleTextfield):
                               @{ keyToken: ToNSValue(onceTokenTextfield),
                                  keyClass: [IMTextfieldTableViewCell class]},
                           
                           @(IMTableViewCellStyleSwitch)   :
                               @{keyToken: ToNSValue(onceTokenSwitch),
                                 keyClass: [IMSwitchTableViewCell class]},
                           
                           @(IMTableViewCellStyleButton)   :
                               @{keyToken: ToNSValue(onceTokenButton),
                                 keyClass: [IMButtonTableViewCell class]},
                           
                           @(IMTableViewCellStylePassword) :
                               @{keyToken: ToNSValue(onceTokenPassword),
                                 keyClass: [IMPasswordTableViewCell class]}
                           };
    
    Class cls = [[dict objectForKey:@(style)] objectForKey:keyClass];
    dispatch_once_t* token = [[[dict objectForKey:@(style)] objectForKey:keyToken] pointerValue];

    dispatch_once(token, ^{
        [self.tableView registerClass:cls forCellReuseIdentifier:NSStringFromClass(cls)];
    });
    return cls;
}

- (void)setupEventHandler:(id)cell
{
    __weak IMSettingTableViewController* weakSelf = self;
    [cell setActionHandler:^(id sender, id value, UIControlEvents events){
        NSLog(@"sender:%@, value:%@", sender, value);
        if (value) {
            [weakSelf.saver setObject:value forKey:[sender key]];
        }
        if ([sender isKindOfClass:[IMButtonTableViewCell class]]) {
            [self buttonDidTouchUpInsideWithKey:[sender key]];
        }else{
            [self valueDidChange:[weakSelf.saver valuesAndKeys] key:[sender key]];
        }
    }];
}

- (void)setupCell:(id)cell indexPath:(NSIndexPath*)indexPath
{
    NSAssert([cell isKindOfClass:[IMTableViewCell class]], @"should be an IMTableViewCell class");

    [self setupEventHandler:cell];
    
    id<IMSettingDataSourceSectonItem> dataSrcItem = [self.dataSrc itemAtIndexPath:indexPath];
    id value = [self.saver objectForKey:[dataSrcItem key]];
    if ([cell isKindOfClass:[IMTextfieldTableViewCell class]]
        || [cell isKindOfClass:[IMPasswordTableViewCell class]])
    {
        [[cell textField] setDelegate:self];
        [[cell textField] setText:value];
    }else if ([cell isKindOfClass:[IMSwitchTableViewCell class]])
    {
        [[cell swi] setOn:[value boolValue]];
    }
}

#pragma mark -

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - UITableView data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSrc numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<IMSettingDataSourceSectonItem> dataSrcItem = [self.dataSrc itemAtIndexPath:indexPath];
    IMTableViewCellStyle style = dataSrcItem.cellStyle;
    NSString* identifier = IMTableViewUtilityCellReuseIdentifierFromStyle(style);
    NSAssert(nil != identifier, @"");
    UITableViewCell* cell = nil;
    Class cls = [self registerCellClassWithStyle:style];
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[cls alloc] initWithStyle:style reuseIdentifier:identifier item:dataSrcItem];
        [self setupCell:cell indexPath:indexPath];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSrc.numOfSections;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.dataSrc headerTextForSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [self.dataSrc footerTextForSection:section];
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<IMSettingDataSourceSectonItem> dataSrcItem = [self.dataSrc itemAtIndexPath:indexPath];
    if ([dataSrcItem subDataSource]) {
        [self.navigationController pushViewController:[[self class] tableViewControllerWithDataSource:[dataSrcItem subDataSource]] animated:YES];
    }
}

@end





