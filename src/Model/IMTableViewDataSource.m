//
//  IMTableViewDataSource.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMTableViewDataSource.h"
#import "IMTableViewUtility.h"

#import "IMTableViewDataSourceSection.h"
#import "IMTableViewDataSourceCell.h"

@interface IMTableViewDataSource()
@property(copy, nonatomic) NSString* tvStyle;
@property(copy, nonatomic) NSString* title;
@property(copy, nonatomic) NSString* headerText;
@property(copy, nonatomic) NSString* footerText;
@property(copy, nonatomic) NSArray* sections;
@end

@implementation IMTableViewDataSource
@dynamic numOfSections;

+ (instancetype)tableViewDataSourceWithDictionary:(NSDictionary*)dict
{
    IMTableViewDataSource* ds = [[[self class] alloc] init];
//    NSDictionary* dict = [NSDictionary dictionaryWithContentsOfFile:path];
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

- (IMTableViewDataSourceCell*)itemAtIndexPath:(NSIndexPath*)indexPath
{
    return [[self.sections[indexPath.section] items][indexPath.row] copy];
}


- (UITableViewStyle) tableViewStyle
{
    return IMTableViewUtilityStyleFromString(self.tvStyle);
}

- (id)copyWithZone:(NSZone *)zone
{
    IMTableViewDataSource* ds = [[[self class] alloc] init];
    ds.title = self.title;
    ds.headerText = self.headerText;
    ds.footerText = self.footerText;
    ds.sections = self.sections;
    return ds;
}

@end



