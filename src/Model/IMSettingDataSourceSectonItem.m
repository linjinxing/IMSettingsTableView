//
//  IMSectionItem.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMSettingDataSourceSectonItem.h"
#import "IMTableViewUtility.h"
#import "keypath.h"

@interface IMSettingDataSourceSectonItem()
@property(copy, nonatomic) NSString* style;
@end


@implementation IMSettingDataSourceSectonItem
@synthesize key,
            imageName,
            textTitle,
            detailTitle,
            defaultValue,
            accessoryType,
            subDataSource;
@dynamic cellStyle;

- (IMTableViewCellStyle) cellStyle
{
    return IMTableViewUtilityCellStyleFromString(self.style);
}

- (id)copyWithZone:(NSZone *)zone
{
    IMSettingDataSourceSectonItem* item = [[[self class] alloc] init];
    [item setValuesForKeysWithDictionary:
                                        [self dictionaryWithValuesForKeys:
                                                                         @[ @keypath(self.key),
                                                                            @keypath(self.imageName),
                                                                            @keypath(self.textTitle),
                                                                            @keypath(self.detailTitle),
                                                                            @keypath(self.defaultValue),
                                                                            @keypath(self.style),
                                                                            @keypath(self.accessoryType)]
                                        ]
     ];
    item.subDataSource = self.subDataSource;
    return item;
}
@end



