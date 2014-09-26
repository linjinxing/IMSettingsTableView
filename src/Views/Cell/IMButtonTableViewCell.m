//
//  IMButtonTableViewCell.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMButtonTableViewCell.h"
#import "IMSettingDataSourceSectonItem.h"

@interface IMButtonTableViewCell()
@property(strong, nonatomic) UIButton* button;
@end

@implementation IMButtonTableViewCell


- (instancetype)initWithStyle:(IMTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier item:(IMSettingDataSourceSectonItem*)item
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:[item textTitle] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        [btn addTarget:self action:@selector(buttonDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        self.button = btn;
    }
    return self;
}


- (void)buttonDidTouchUpInside:(UIButton*)sender
{
    if (self.actionHandler) {
        self.actionHandler(self, nil, UIControlEventTouchUpInside);
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
    self.button.layer.borderColor = [UIColor blueColor].CGColor;
    self.button.layer.borderWidth = 1.0;
    CGRect frame = self.contentView.frame;
    self.button.frame = CGRectInset(frame, IMTableViewControlSpace * 2, .0f) ;
}

@end
