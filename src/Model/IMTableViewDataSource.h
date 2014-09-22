//
//  IMTableViewDataSource.h
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IMTableViewDataSourceCell;

@interface IMTableViewDataSource : NSObject<NSCopying>
@property(assign, nonatomic, readonly) UITableViewStyle tableViewStyle;
@property(copy, nonatomic, readonly) NSString* title;
@property(copy, nonatomic, readonly) NSString* headerText;
@property(copy, nonatomic, readonly) NSString* footerText;
@property(assign, nonatomic, readonly) NSUInteger numOfSections;

+ (instancetype)tableViewDataSourceWithPlistPath:(NSString*)path;
- (NSUInteger)numberOfRowsInSection:(NSInteger)section;
- (IMTableViewDataSourceCell*)itemAtIndexPath:(NSIndexPath*)indexPath;
@end


