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

#import "IMTextfieldTableViewCell.h"
#import "IMSwitchTableViewCell.h"
#import "IMButtonTableViewCell.h"
#import "IMPasswordTableViewCell.h"

#import "IMSettingDataSourceSection.h"
#import "IMSettingDataSourceSectonItem.h"

#define ToNSValue(val) [NSValue valueWithPointer:&val]

@interface IMSettingTableViewController()
@end

@implementation IMSettingTableViewController

+ (instancetype)tableViewControllerWithDataSource:(id<IMSettingDataSource>)dataSrc
{
    IMSettingTableViewController* tableViewCtrl = [[[self class] alloc] initWithStyle:dataSrc.tableViewStyle];
    tableViewCtrl.dataSrc = dataSrc;
    return tableViewCtrl;
}



- (Class)registerCellClassWithStyle:(IMTableViewCellStyle)style
{
    static dispatch_once_t onceTokenSystem;
    static dispatch_once_t onceTokenTextfield;
    static dispatch_once_t onceTokenSwitch;
    static dispatch_once_t onceTokenButton;
    static dispatch_once_t onceTokenPassword;
    
    NSString* keyToken = @"token";
    NSString* keyClass = @"class";

    NSDictionary* dictValueForSystemStyle = @{ keyToken: ToNSValue(onceTokenSystem),
                                               keyClass: [UITableViewCell class]};
    
    NSDictionary* dict = @{
                           @(IMTableViewCellStyleDefault):  dictValueForSystemStyle,
                           @(IMTableViewCellStyleValue1):   dictValueForSystemStyle,
                           @(IMTableViewCellStyleValue2):   dictValueForSystemStyle,
                           @(IMTableViewCellStyleSubtitle): dictValueForSystemStyle,

                           @(IMTableViewCellStyleTextfield):
                               @{ keyToken: ToNSValue(onceTokenTextfield),
                                  keyClass: [IMTextfieldTableViewCell class]},
                           
                           @(IMTableViewCellStyleSwitch)   :
                               @{keyToken: ToNSValue(onceTokenSwitch),
                                 keyClass: [IMSwitchTableViewCell class]},
                           
                           @(IMTableViewCellStyleButton)   :
                               @{keyToken: ToNSValue(onceTokenButton),
                                 keyClass: [IMButtonTableViewCell class]},
                           
                           @(IMTableViewCellStylePassword)   :
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

#pragma mark data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSrc numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<IMSettingDataSourceSectonItem> dataSrcItem = [self.dataSrc itemAtIndexPath:indexPath];
    IMTableViewCellStyle style = dataSrcItem.cellStyle;
    NSString* identifier = IMTableViewUtilityCellReuseIdentifierFromStyle(style);
    UITableViewCell* cell = nil;
    Class cls = [self registerCellClassWithStyle:style];
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        if ([UITableViewCell class] == cls) {
            cell = [[cls alloc] initWithStyle:(UITableViewCellStyle)style reuseIdentifier:identifier];
            if ([dataSrcItem.accessoryType length]) {
                cell.accessoryType = IMTableViewUtilityCellAccessoryTypeFromString(dataSrcItem.accessoryType);
            }
        }else{
            cell = [[cls alloc] initWithStyle:style reuseIdentifier:identifier item:dataSrcItem];
        }
        
        if ([dataSrcItem.textTitle length]) {
            cell.textLabel.text = dataSrcItem.textTitle;
        }
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


@end





