//
//  IMSettingProtocol.h
//  IMSettingTableView
//
//  Created by LoveYouForever on 9/24/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, IMTableViewCellStyle){
    IMTableViewCellStyleDefault = UITableViewCellStyleDefault,
    IMTableViewCellStyleValue1 = UITableViewCellStyleValue1,
    IMTableViewCellStyleValue2 = UITableViewCellStyleValue2,
    IMTableViewCellStyleSubtitle = UITableViewCellStyleSubtitle,
    IMTableViewCellStyleTextfield,
    IMTableViewCellStyleSwitch,
    IMTableViewCellStyleButton,
    IMTableViewCellStylePassword
};

@protocol IMSettingDataSourceSectonItem;

@protocol IMSettingDataSource <NSObject>
@property(copy,   nonatomic, readonly) NSString* title;
@property(copy,   nonatomic, readonly) NSString* headerText;
@property(copy,   nonatomic, readonly) NSString* footerText;
@property(assign, nonatomic, readonly) NSUInteger numOfSections;
@property(assign, nonatomic, readonly) UITableViewStyle tableViewStyle;

- (NSUInteger)numberOfRowsInSection:(NSInteger)section;
- (NSString*)headerTextForSection:(NSInteger)section;
- (NSString*)footerTextForSection:(NSInteger)section;
- (id<IMSettingDataSourceSectonItem>)itemAtIndexPath:(NSIndexPath*)indexPath;
@end

@protocol IMSettingDataSourceSectonItem <NSObject>
@property(copy, nonatomic) NSString* key;
@property(copy, nonatomic) NSString* imageName;
@property(copy, nonatomic) NSString* textTitle;
@property(copy, nonatomic) NSString* detailTitle;
@property(copy, nonatomic) NSString* defaultValue;
@property(copy, nonatomic) NSString* accessoryType;
@property(readonly, assign, nonatomic) IMTableViewCellStyle cellStyle;

@property(strong, nonatomic) id<IMSettingDataSource> subDataSource;
@end


@protocol IMTableViewCell <NSObject>
- (instancetype)initWithStyle:(IMTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier item:(id<IMSettingDataSourceSectonItem>)item;
@end





