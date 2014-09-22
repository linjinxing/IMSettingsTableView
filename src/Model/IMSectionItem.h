//
//  IMSectionItem.h
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMTableViewDataSource;

@interface IMSectionItem : NSObject<NSCopying>
@property(copy, nonatomic) NSString* key;
@property(copy, nonatomic) NSString* imageName;
@property(copy, nonatomic) NSString* textTitle;
@property(copy, nonatomic) NSString* detailTitle;
@property(copy, nonatomic) NSString* defaultValue;
@property(copy, nonatomic) NSString* cellStyle;
@property(copy, nonatomic) IMTableViewDataSource* subDataSource;
@end
