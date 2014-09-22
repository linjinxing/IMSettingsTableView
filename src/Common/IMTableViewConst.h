//
//  IMTableViewConst.h
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXTERN const float IMTableViewControlSpace ;

typedef NS_ENUM(NSUInteger, IMTableViewCellStyle){
    IMTableViewCellStyleDefault = UITableViewCellStyleDefault,
    IMTableViewCellStyleValue1 = UITableViewCellStyleValue1,
    IMTableViewCellStyleValue2 = UITableViewCellStyleValue2,
    IMTableViewCellStyleSubtitle = UITableViewCellStyleSubtitle,
    IMTableViewCellStyleTextfield,
    IMTableViewCellStyleSwitch,
    IMTableViewCellStyleButton
};