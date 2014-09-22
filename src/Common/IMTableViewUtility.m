//
//  IMTableViewUtility.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMTableViewUtility.h"


UITableViewStyle IMTableViewUtilityStyleFromString(NSString* text)
{
    return [[@{@"Grouped" : @(UITableViewStyleGrouped),
               @"Plain" : @(UITableViewStylePlain)}
             valueForKey:text]
                   integerValue];
}


IMTableViewCellStyle IMTableViewUtilityCellStyleFromString(NSString* text)
{
    return [[@{@"Default" : @(IMTableViewCellStyleDefault),
               @"Value1" : @(IMTableViewCellStyleValue1),
               @"Value2" : @(IMTableViewCellStyleValue2),
               @"Subtitle" : @(IMTableViewCellStyleSubtitle),
               @"Textfield" : @(IMTableViewCellStyleTextfield),
               @"Switch" : @(IMTableViewCellStyleSwitch),
               @"Button" : @(IMTableViewCellStyleButton),
               }
             valueForKey:text]
             integerValue];
}


