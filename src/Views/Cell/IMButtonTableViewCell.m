//
//  IMButtonTableViewCell.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMButtonTableViewCell.h"

@interface IMButtonTableViewCell()
@property(strong, nonatomic) UIButton* button;
@end

@implementation IMButtonTableViewCell

- (void)setupSubviews
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.accessoryView = btn;
    self.button = btn;
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
    CGRect frame = self.contentView.frame;
    self.button.frame = frame;
}

@end
