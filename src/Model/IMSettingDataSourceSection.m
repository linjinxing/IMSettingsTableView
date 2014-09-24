//
//  IMSection.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMSettingDataSourceSection.h"
#import "IMSettingDataSourceSectonItem.h"

@implementation IMSettingDataSourceSection
- (id)copyWithZone:(NSZone *)zone
{
    IMSettingDataSourceSection* sec = [[[self class] alloc] init];
    sec.headerText = self.headerText;
    sec.footerText = self.footerText;
    sec.cells = self.cells;
    return sec;
}

+ (instancetype) tableViewDataSourceSectionWithCells:(NSArray*)dictCells headerText:(NSString*)htext footerText:(NSString*)fText
{
    IMSettingDataSourceSection* s = [[[self class] alloc] init];
    s.headerText = htext;
    s.footerText = fText;
    
    NSMutableArray* a = [NSMutableArray arrayWithCapacity:[dictCells count]];
    for (NSDictionary* dict in dictCells) {
        IMSettingDataSourceSectonItem* cell = [[IMSettingDataSourceSectonItem alloc] init];
        [cell setValuesForKeysWithDictionary:dict];
        [a addObject:cell];
    }
    s.cells = a;
    return s;
}

+ (instancetype) tableViewDataSourceSectionWithCells:(NSArray*)dictCells
{
    return [self tableViewDataSourceSectionWithCells:dictCells headerText:nil footerText:nil];
}

@end



