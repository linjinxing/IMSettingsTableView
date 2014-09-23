//
//  IMTableViewUtility.h
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IMTableViewConst.h"

UITableViewStyle IMTableViewUtilityStyleFromString(NSString* text);

IMTableViewCellStyle IMTableViewUtilityCellStyleFromString(NSString* text);

NSString* IMTableViewUtilityCellReuseIdentifierFromStyle(IMTableViewCellStyle style);