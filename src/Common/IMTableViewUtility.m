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
    return [[@{ IMTableViewStyleGroupedString : @(UITableViewStyleGrouped),
               IMTableViewStylePlainString : @(UITableViewStylePlain)}
             valueForKey:text]
                integerValue];
}


IMTableViewCellStyle IMTableViewUtilityCellStyleFromString(NSString* text)
{
    return [[@{IMTableViewCellStyleDefaultString   : @(IMTableViewCellStyleDefault),
               IMTableViewCellStyleValue1String    : @(IMTableViewCellStyleValue1),
               IMTableViewCellStyleValue2String    : @(IMTableViewCellStyleValue2),
               IMTableViewCellStyleSubtitleString  : @(IMTableViewCellStyleSubtitle),
               IMTableViewCellStyleTextfieldString : @(IMTableViewCellStyleTextfield),
               IMTableViewCellStyleSwitchString    : @(IMTableViewCellStyleSwitch),
               IMTableViewCellStyleButtonString    : @(IMTableViewCellStyleButton),
               }
             valueForKey:text]
                integerValue];
}

UITableViewCellAccessoryType IMTableViewUtilityCellAccessoryTypeFromString(NSString* text)
{
  return [[@{IMTableViewCellAccessoryNone     : @(UITableViewCellAccessoryNone),
            IMTableViewCellAccessoryDisclosureIndicator    :   @(UITableViewCellAccessoryDisclosureIndicator),
            IMTableViewCellAccessoryDetailDisclosureButton    : @(UITableViewCellAccessoryDetailDisclosureButton),
            IMTableViewCellAccessoryCheckmark  : @(UITableViewCellAccessoryCheckmark),
            IMTableViewCellAccessoryDetailButton : @(UITableViewCellAccessoryDetailButton),
//               IMTableViewCellStyleSwitchString    : @(IMTableViewCellStyleSwitch),
//               IMTableViewCellStyleButtonString    : @(IMTableViewCellStyleButton),
               }
             valueForKey:text]
            integerValue];
}


NSString* IMTableViewUtilityCellReuseIdentifierFromStyle(IMTableViewCellStyle style)
{
    return [@{ @(IMTableViewCellStyleDefault)    : IMTableViewCellReuseIdentifierDefault ,
                @(IMTableViewCellStyleValue1)    : IMTableViewCellReuseIdentifierStyleValue1 ,
                @(IMTableViewCellStyleValue2)    : IMTableViewCellReuseIdentifierStyleValue2 ,
                @(IMTableViewCellStyleSubtitle)  : IMTableViewCellReuseIdentifierStyleSubtitle,
                @(IMTableViewCellStyleTextfield) : IMTableViewCellReuseIdentifierStyleTextfield ,
                @(IMTableViewCellStyleSwitch)    : IMTableViewCellReuseIdentifierStyleSwitch,
                @(IMTableViewCellStyleButton)    : IMTableViewCellReuseIdentifierStyleButton
               }
             objectForKey:@(style)];
}





