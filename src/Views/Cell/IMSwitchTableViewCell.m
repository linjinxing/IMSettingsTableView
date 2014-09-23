//
//  IMSwitchTableViewCell.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMSwitchTableViewCell.h"

@interface IMSwitchTableViewCell()
@property(strong, nonatomic) UISwitch* uiswitch;
@end

@implementation IMSwitchTableViewCell

- (void)setupSubviews
{
    UISwitch* s = [[UISwitch alloc] init];
    self.accessoryView = s;
    self.uiswitch = s;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
