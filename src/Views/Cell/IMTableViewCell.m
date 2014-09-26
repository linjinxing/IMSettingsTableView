//
//  IMTableViewCell.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMTableViewCell.h"
#import "IMSettingDataSourceSectonItem.h"
#import "IMTableViewUtility.h"

@implementation IMTableViewCell
@synthesize actionHandler, key;


- (instancetype)initWithStyle:(IMTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier item:(IMSettingDataSourceSectonItem*)item
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.key = [item key];
        self.textLabel.text = [item textTitle];
        if ([item.accessoryType length]) {
            self.accessoryType = IMTableViewUtilityCellAccessoryTypeFromString(item.accessoryType);
        }
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%p, key:%@, text:%@", self, self.key, self.textLabel.text];
}

@end
