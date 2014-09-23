//
//  IMSection.h
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMTableViewDataSourceSection : NSObject<NSCopying>
@property(copy, nonatomic) NSString* headerText;
@property(copy, nonatomic) NSString* footerText;
@property(copy, nonatomic) NSArray* cells;

+ (instancetype) tableViewDataSourceSectionWithCells:(NSArray*)dictCells;
+ (instancetype) tableViewDataSourceSectionWithCells:(NSArray*)dictCells headerText:(NSString*)htext footerText:(NSString*)fText;
@end


