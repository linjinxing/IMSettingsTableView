//
//  IMSectionItem.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMSectionItem.h"

@implementation IMSectionItem
- (id)copyWithZone:(NSZone *)zone
{
    IMSectionItem* item = [[[self class] alloc] init];
    item.key = self.key;
    item.imageName = self.imageName;
    item.textTitle = self.textTitle;
    item.detailTitle = self.detailTitle;
    item.defaultValue = self.defaultValue;
    item.cellStyle = self.cellStyle;
    item.subDataSource = self.subDataSource;
    return item;
}
@end
