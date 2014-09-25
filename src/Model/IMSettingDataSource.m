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

+ (instancetype)settingDataSourceWithDictionary:(NSDictionary*)aDict
{
    IMSettingDataSource* ds = [[[self class] alloc] init];
    ds.tvStyle = [aDict valueForKey:IMTableViewDictionaryKeyStyle];
    ds.title = [aDict valueForKey:IMTableViewDictionaryKeyTitle];
    ds.headerText = [aDict valueForKey:IMTableViewDictionaryKeyHeaderText];
    ds.footerText = [aDict valueForKey:IMTableViewDictionaryKeyFooterText];
    
    NSArray* strSections = [aDict valueForKey:IMTableViewDictionaryKeySections];
    NSMutableArray* sections = [NSMutableArray arrayWithCapacity:[strSections count]];
    for (NSDictionary* dict in strSections){
        IMSettingDataSourceSection* s = [IMSettingDataSourceSection tableViewDataSourceSectionWithCells:[dict valueForKey:IMTableViewSectionDictionaryKeyCells] headerText:[dict valueForKey:IMTableViewSectionDictionaryKeyHeaderText] footerText:[dict valueForKey:IMTableViewSectionDictionaryKeyFooterText]];
        if (s) [sections addObject:s];
    }
    if ([sections count]) ds.sections = [sections copy];
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



