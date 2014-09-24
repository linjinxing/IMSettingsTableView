//
//  IMSectionItem.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMSettingDataSourceSectonItem.h"
#import "IMTableViewUtility.h"
#import "NSObjectAddition.h"
#import "keypath.h"

@interface IMSettingDataSourceSectonItem()
@property(copy, nonatomic) NSString* style;
@end


@implementation IMSettingDataSourceSectonItem
@dynamic style;

- (IMTableViewCellStyle) cellStyle
{
    return IMTableViewUtilityCellStyleFromString(self.style);
}

- (id)copyWithZone:(NSZone *)zone
{
    IMSettingDataSourceSectonItem* item = [[[self class] alloc] init];
    [item setValuesForKeysWithDictionary:
                                        [self dictionaryWithValuesForKeys:[self allPropertyNames]]
//                                                                         @[@keypath(self.key),
//                                                                            @"imageName",
//                                                                            @"textTitle",
//                                                                            @"detailTitle",
//                                                                            @"defaultValue",
//                                                                            @"style",
//                                                                            @"subDataSource",
//                                                                            @"accessoryType"]
//                                        ]
     ];
//    item.key = self.key;
//    item.imageName = self.imageName;
//    item.textTitle = self.textTitle;
//    item.detailTitle = self.detailTitle;
//    item.defaultValue = self.defaultValue;
//    item.style = self.style;
//    item.subDataSource = self.subDataSource;
    return item;
}
@end



