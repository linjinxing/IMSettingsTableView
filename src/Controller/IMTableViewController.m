//
//  IMTableViewController.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMTableViewController.h"
#import "IMTableViewDataSource.h"
#import "IMTableViewUtility.h"

#import "IMTextfieldTableViewCell.h"
#import "IMSwitchTableViewCell.h"
#import "IMButtonTableViewCell.h"

#import "IMTableViewDataSourceSection.h"
#import "IMTableViewDataSourceCell.h"

@interface IMTableViewController()
@property(strong, nonatomic)IMTableViewDataSource* dataSrc;
@end

@implementation IMTableViewController

+ (instancetype)tableViewControllerWithDataSource:(IMTableViewDataSource* )dataSrc
{
    IMTableViewController* tableViewCtrl = [[[self class] alloc] initWithStyle:dataSrc.tableViewStyle];
    tableViewCtrl.dataSrc = dataSrc;
    return tableViewCtrl;
}


- (void)registerCellClassWithStyle:(IMTableViewCellStyle)style
{
    static dispatch_once_t onceTokenTextfield;
    static dispatch_once_t onceTokenSwitch;
    static dispatch_once_t onceTokenButton;
    NSString* keyToken = @"token";
    NSString* keyClass = @"class";
    
#define ToNSValue(val) [NSValue valueWithPointer:&val]
    
    NSDictionary* dict = @{@(IMTableViewCellStyleTextfield):
                                @{keyToken: ToNSValue(onceTokenTextfield),
                                  keyClass: [IMTextfieldTableViewCell class]},
                           
                           @(IMTableViewCellStyleSwitch)   :
                               @{keyToken: ToNSValue(onceTokenSwitch),
                                 keyClass: [IMSwitchTableViewCell class]},
                           
                           @(IMTableViewCellStyleButton)   :
                               @{keyToken: ToNSValue(onceTokenButton),
                                 keyClass: [IMButtonTableViewCell class]}
                           };
    
    Class cls = [[dict objectForKey:@(style)] objectForKey:keyClass];
    dispatch_once_t* token = [[[dict objectForKey:@(style)] objectForKey:keyToken] pointerValue];

    dispatch_once(token, ^{
        [self.tableView registerClass:cls forCellReuseIdentifier:NSStringFromClass(cls)];
    });
}

#pragma mark data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSrc numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IMTableViewDataSourceCell* dataSrcCell = [self.dataSrc itemAtIndexPath:indexPath];
    IMTableViewCellStyle style = dataSrcCell.cellStyle;
    NSString* identifier = IMTableViewUtilityCellReuseIdentifierFromStyle(style);
    UITableViewCell* cell = nil;
    Class cls = nil;
    switch (style) {
        case IMTableViewCellStyleDefault:
        case IMTableViewCellStyleValue1:
        case IMTableViewCellStyleValue2:
        case IMTableViewCellStyleSubtitle:
        {
            cls = [UITableViewCell class];
            break;
        }
        default:
        {   
            [self registerCellClassWithStyle:style];
            break;
        }
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[cls alloc] initWithStyle:(UITableViewCellStyle)style reuseIdentifier:identifier];
        if ([dataSrcCell.textTitle length]) {
            cell.textLabel.text = dataSrcCell.textTitle;
        }
        if ([dataSrcCell.accessoryType length]) {
            cell.accessoryType = IMTableViewUtilityCellAccessoryTypeFromString(dataSrcCell.accessoryType);
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





