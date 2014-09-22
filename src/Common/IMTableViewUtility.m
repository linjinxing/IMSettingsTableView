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
    NSDictionary* dict = @{@"Grouped" : @(UITableViewStyleGrouped),
                           @"Plain" : @(UITableViewStylePlain)};
    return [[dict valueForKey:text] integerValue];
}
