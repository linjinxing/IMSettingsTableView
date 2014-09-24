//
//  IMTableViewDataSource.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMSettingDataSource.h"
#import "IMTableViewUtility.h"

#import "IMSettingDataSourceSection.h"
#import "IMSettingDataSourceSectonItem.h"

@interface IMSettingDataSource()
@property(copy, nonatomic) NSString* tvStyle;
@property(copy, nonatomic) NSString* title;
@property(copy, nonatomic) NSString* headerText;
@property(copy, nonatomic) NSString* footerText;
@property(copy, nonatomic) NSArray* sections;
@end

@implementation IMSettingDataSource
@dynamic numOfSections;

+ (instancetype)tableViewDataSourceWithDictionary:(NSDictionary*)dict
{
    IMSettingDataSource* ds = [[[self class] alloc] init];
    ds.tvStyle = [dict valueForKey:IMTableViewDictionaryKeyStyle];
    ds.title = [dict valueForKey:IMTableViewDictionaryKeyTitle];
    ds.headerText = [dict valueForKey:IMTableViewDictionaryKeyHeaderText];
    ds.footerText = [dict valueForKey:IMTableViewDictionaryKeyFooterText];
    
    NSArray* strSections = [dict valueForKey:IMTableViewDictionaryKeySections];
    NSMutableArray* a = [NSMutableArray arrayWithCapacity:[strSections count]];
    for (NSDictionary* dict in strSections){
        IMSettingDataSourceSection* s = [IMSettingDataSourceSection tableViewDataSourceSectionWithCells:[dict valueForKey:IMTableViewSectionDictionaryKeyCells] headerText:[dict valueForKey:IMTableViewSectionDictionaryKeyHeaderText] footerText:[dict valueForKey:IMTableViewSectionDictionaryKeyFooterText]];
        if (s) [a addObject:s];
    }
    return ds;
}

- (NSUInteger)numOfSections
{
    return [self.sections count];
}

- (NSUInteger)numberOfRowsInSection:(NSInteger)section
{
    return [[self.sections[section] items] count];
}

- (IMSettingDataSourceSectonItem*)itemAtIndexPath:(NSIndexPath*)indexPath
{
    return [[self.sections[indexPath.section] items][indexPath.row] copy];
}

- (NSString*)headerTextForSection:(NSInteger)section
{
    return [self.sections[section] headerText];
}

- (NSString*)footerTextForSection:(NSInteger)section
{
    return [self.sections[section] footerText];
}

- (UITableViewStyle) tableViewStyle
{
    return IMTableViewUtilityStyleFromString(self.tvStyle);
}

- (id)copyWithZone:(NSZone *)zone
{
    IMSettingDataSource* ds = [[[self class] alloc] init];
    ds.title = self.title;
    ds.headerText = self.headerText;
    ds.footerText = self.footerText;
    ds.sections = self.sections;
    return ds;
}

@end



