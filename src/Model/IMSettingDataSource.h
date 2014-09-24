//
//  IMTableViewDataSource.h
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMTableViewConst.h"
#import "IMSettingProtocol.h"

@interface IMSettingDataSource : NSObject<IMSettingDataSource, NSCopying>
+ (instancetype)tableViewDataSourceWithDictionary:(NSDictionary*)dict;
@end


