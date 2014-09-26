//
//  IMSwitchTableViewCell.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMSwitchTableViewCell.h"
#import "IMSettingDataSourceSectonItem.h"

@interface IMSwitchTableViewCell()
@property(strong, nonatomic) UISwitch* swi;
@end

@implementation IMSwitchTableViewCell

- (instancetype)initWithStyle:(IMTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier item:(IMSettingDataSourceSectonItem*)item
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier item:item];
    if (self) {
        UISwitch* s = [[UISwitch alloc] init];
        self.accessoryView = s;
        s.on = [[item defaultValue] boolValue];
        [s addTarget:self action:@selector(switchValueDidChange:) forControlEvents:UIControlEventValueChanged];
        self.swi = s;
    }
    return self;
}


- (void)switchValueDidChange:(UISwitch*)sender
{
    if (self.actionHandler) {
        self.actionHandler(self, @(self.swi.on), UIControlEventValueChanged);
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"layoutSubviews");
}

@end
