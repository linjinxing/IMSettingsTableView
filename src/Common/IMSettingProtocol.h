//
//  IMSettingProtocol.h
//  IMSettingTableView
//
//  Created by LoveYouForever on 9/24/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IMControlActionProtocol.h"

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


@protocol IMTableViewCell <IMControlActionHandler, NSObject>
@property(nonatomic, copy) NSString* key;
- (instancetype)initWithStyle:(IMTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier item:(id<IMSettingDataSourceSectonItem>)item;
@end

@protocol IMSettingSaver
- (NSDictionary*)valuesAndKeys;
+ (instancetype)settingSaverWithKeys:(NSArray*)keys;
- (void)save;

- (id)objectForKey:(NSString *)defaultName;
- (void)setObject:(id)value forKey:(NSString *)defaultName;
- (void)removeObjectForKey:(NSString *)defaultName;

- (NSString *)stringForKey:(NSString *)defaultName;
- (NSArray *)arrayForKey:(NSString *)defaultName;
- (NSDictionary *)dictionaryForKey:(NSString *)defaultName;
- (NSData *)dataForKey:(NSString *)defaultName;
- (NSArray *)stringArrayForKey:(NSString *)defaultName;
- (NSInteger)integerForKey:(NSString *)defaultName;
- (float)floatForKey:(NSString *)defaultName;
- (double)doubleForKey:(NSString *)defaultName;
- (BOOL)boolForKey:(NSString *)defaultName;
- (NSURL *)URLForKey:(NSString *)defaultName;

- (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;
- (void)setFloat:(float)value forKey:(NSString *)defaultName;
- (void)setDouble:(double)value forKey:(NSString *)defaultName;
- (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
- (void)setURL:(NSURL *)url forKey:(NSString *)defaultName;
@end





