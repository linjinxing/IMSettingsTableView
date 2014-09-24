//
//  IMTableViewCellProtocol.h
//  IMSettingTableView
//
//  Created by LoveYouForever on 9/24/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

@class IMSettingDataSourceSectonItem;

@protocol IMTableViewCell <NSObject>
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier item:(IMSettingDataSourceSectonItem*)item;
@end

